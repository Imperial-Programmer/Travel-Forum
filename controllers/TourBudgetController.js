import { Connection } from '../config/connection.js';
import { pusher } from '../config/pusher.js';
import moment from 'moment';

import { stripHtml } from "string-strip-html";

export const TourBudgetController = {

    /**
     * Find all users
     * @param req
     * @param res
     */
    find: function (req, res) {
        if (req.session.loggedin) {

            const msgSuccess = req.flash('msgSuccess');
            const msgError = req.flash('msgError');

            Connection.query(`SELECT tour_by_budgets.*, count(threads.id) as thread_count FROM tour_by_budgets left join threads on tour_by_budgets.id = threads.tour_by_budget_id group by tour_by_budgets.id`, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                if (results.length > 0) {
                    res.render('tour_by_budget/index', {
                        session: req.session,
                        category_list: results,
                        msgError: msgError,
                        msgSuccess: msgSuccess
                    });
                }
            });

        } else {
            res.redirect('/login');
        }
    },

    /**
     * Find one user
     * @param req
     * @param res
     */
    findOne: function (req, res) {

        var id = req.params.id;

        if (req.session.loggedin) {

            const getThreadDetail = (id) => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT c.*, name, u.created_at as joined_at from threads c inner join users u on c.user_id = u.id where c.id = ?`, [id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results[0]);
                    });
                });
            }

            const getReply = (id) => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT c.*, name, DATE_FORMAT(c.created_at, '%d %M %Y %H:%i') as thread_reply_created_at,DATE_FORMAT(u.created_at, '%d %M %Y') as joined_at from thread_replies c inner join users u on c.user_id = u.id where c.thread_id = ?`, [id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }


            const async_function = async () => {
                const threadDetailData = await getThreadDetail(id);
                const replyData = await getReply(id);

                let reply_list = JSON.parse(JSON.stringify(replyData));
                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('forum/detail', {
                    session: req.session,
                    thread_detail: threadDetailData,
                    reply_list: reply_list,
                    strip_html: stripHtml,
                    msgError: msgError,
                    msgSuccess: msgSuccess
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    },

    findSub: function (req, res) {

        var thread_list;

        var id = req.params.id;

        const getCategory = (id) => {
            return new Promise(function (resolve, reject) {
                Connection.query(`SELECT title FROM tour_by_budgets where id = ?`, [id], function (error, results, fields) {
                    // If there is an issue with the query, output the error
                    if (error) throw reject(error);
                    // If the account exists

                    resolve(results[0]);
                });
            });
        }

        const getThread = (id) => {
            return new Promise(function (resolve, reject) {
                Connection.query(`SELECT c.*, name, count(t.id) as jumlah, DATE_FORMAT(c.created_at, '%d %M %Y %H:%i') as thread_created_at from threads c inner join users u on c.user_id = u.id left join thread_replies t on t.thread_id = c.id where c.tour_by_budget_id = ?  group by c.id order by c.created_at desc`, [id], function (error, results, fields) {
                    // If there is an issue with the query, output the error
                    if (error) throw reject(error);
                    // If the account exists

                    resolve(results);
                });
            });
        }

        if (req.session.loggedin) {

            const async_function = async () => {
                const threadData = await getThread(id);
                const categoryData = await getCategory(id);

                thread_list = JSON.parse(JSON.stringify(threadData));

                console.log(thread_list);

                res.render('tour_by_budget/subforum', {
                    session: req.session,
                    thread_list: thread_list,
                    category_thread: categoryData,
                    strip_html: stripHtml,
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    },

    myThread: function (req, res) {

        const getThread = (id) => {
            return new Promise(function (resolve, reject) {
                Connection.query(`SELECT c.*, name, count(t.id) as jumlah, DATE_FORMAT(c.created_at, '%d %M %Y %H:%i') as thread_created_at from threads c inner join users u on c.user_id = u.id left join thread_replies t on t.thread_id = c.id where c.user_id = ?  group by c.id order by c.created_at desc`, [id], function (error, results, fields) {
                    // If there is an issue with the query, output the error
                    if (error) throw reject(error);
                    // If the account exists

                    resolve(results);
                });
            });
        }

        if (req.session.loggedin) {

            var user_id = req.session.user_id;

            const async_function = async () => {
                const threadData = await getThread(user_id);

                const thread_list = JSON.parse(JSON.stringify(threadData));
                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('forum/my_thread', {
                    session: req.session,
                    thread_list: thread_list,
                    strip_html: stripHtml,
                    msgSuccess: msgSuccess,
                    msgError: msgError
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    },


    /**
     * Create a new user
     * @param req
     * @param res
     * @returns {*}
     */
    create: function (req, res) {

        const getCategory = () => {
            return new Promise(function (resolve, reject) {
                Connection.query(`SELECT * from thread_categories`, function (error, results, fields) {
                    // If there is an issue with the query, output the error
                    if (error) throw reject(error);
                    // If the account exists

                    resolve(results);
                });
            });
        }

        if (req.session.loggedin) {
            const async_function = async () => {
                const categoryData = await getCategory();

                let category_list = JSON.parse(JSON.stringify(categoryData));

                res.render('forum/create', {
                    session: req.session,
                    category_list
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    },

    store: function (req, res) {
        if (req.session.loggedin) {
            let title = req.body.title;
            let category_id = req.body.category_id;
            let content = req.body.content;
            let user_id = req.session.user_id;

            Connection.query('INSERT INTO threads(user_id, title, thread_category_id, content, created_at) VALUES (?, ?, ?, ?, NOW())', [user_id, title, category_id, content], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Thread baru berhasil dipublikasikan.');
            res.redirect('/forum/my-thread');
        } else {
            res.redirect('/login');
        }
    },

    saveReply: function (req, res) {
        if (req.session.loggedin) {
            let thread_id = req.body.thread_id;
            let content = req.body.content;
            let user_id = req.session.user_id;

            Connection.query('INSERT INTO thread_replies(thread_id, user_id, content, created_at) VALUES (?, ?, ?, NOW())', [thread_id, user_id, content], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            pusher.trigger("my-channel", "my-event", {
                message: "Halo Dunia"
            });

            req.flash('msgSuccess', 'Balas thread berhasil.');
            res.redirect('/forum/detail/' + thread_id);
        } else {
            res.redirect('/login');
        }
    },

    edit: function (req, res) {
        var id = req.params.id;

        if (req.session.loggedin) {

            const getThreadDetail = (id) => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from threads where id = ? AND user_id = ?`, [id, req.session.user_id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results[0]);
                    });
                });
            }

            const getCategory = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from thread_categories`, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const async_function = async () => {
                const threadDetailData = await getThreadDetail(id);
                const categoryData = await getCategory();

                let category_list = JSON.parse(JSON.stringify(categoryData));

                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('forum/edit', {
                    session: req.session,
                    thread_detail: threadDetailData,
                    strip_html: stripHtml,
                    category_list: category_list,
                    msgError: msgError,
                    msgSuccess: msgSuccess
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    },

    /**
     * Update user by id
     * @param req
     * @param res
     */
    update: function (req, res) {

        if (req.session.loggedin) {
            let id = req.body.thread_id;
            let title = req.body.title;
            let category_id = req.body.category_id;
            let content = req.body.content;

            Connection.query('UPDATE threads SET title = ?, thread_category_id = ?, content = ?, updated_at = NOW() where id = ?', [title, category_id, content, id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Thread berhasil diubah.');
            res.redirect('/forum/my-thread');
        } else {
            res.redirect('/login');
        }


    },

    /**
     * Delete user by id
     * @param req
     * @param res
     */
    destroy: function (req, res) {

        var id = req.params.id;

        if (req.session.loggedin) {

            Connection.query('DELETE FROM threads where id = ?', [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Thread berhasil dihapus.');
            res.redirect('/forum/my-thread');
        } else {
            res.redirect('/login');
        }
    },

    reaction: function (req, res) {
        if (req.session.loggedin) {
            let id = req.params.id;
            let status = req.params.status;
            let user_id = req.session.user_id;

            Connection.query(`select * from thread_reacts where thread_id = ? and user_id = ?`, [id, user_id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                if (results.length > 0) {
                    let sql = `UPDATE thread_reacts set react = ${status} WHERE thread_id = ${id} and user_id = ${user_id}`;
                    Connection.query(sql, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw error;
                    });
                } else {
                    let sql = `INSERT INTO thread_reacts (thread_id, user_id, react) VALUES (${id}, ${user_id}, ${status})`;
                    Connection.query(sql, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw error;
                    });
                }
            });

            res.send('React Thread success');
        } else {
            res.send('You need to login first');
        }
    },

    reactionReply: function (req, res) {
        if (req.session.loggedin) {
            let id = req.params.id;
            let status = req.params.status;
            let user_id = req.session.user_id;

            Connection.query(`select * from thread_reply_reacts where thread_reply_id = ? and user_id = ?`, [id, user_id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                if (results.length > 0) {
                    let sql = `UPDATE thread_reply_reacts set react = ${status} WHERE thread_reply_id = ${id} and user_id = ${user_id}`;
                    Connection.query(sql, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw error;
                    });
                } else {
                    let sql = `INSERT INTO thread_reply_reacts (thread_reply_id, user_id, react) VALUES (${id}, ${user_id}, ${status})`;
                    Connection.query(sql, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw error;
                    });
                }
            });


            res.send('React Thread reply success');
        } else {
            res.send('You need to login first');
        }
    }
};