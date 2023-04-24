import { Connection } from '../../config/connection.js';

export const ThreadCategoryController = {

    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `SELECT * from thread_categories order by created_at desc`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                res.render('backend/thread_category/index', {
                    session: req.session,
                    thread_category_list: results,
                });

            });
        } else {
            res.redirect('/admin/login');
        }
    },

    create: function (req, res) {
        if (req.session.loggedin_admin) {
            res.render('backend/thread_category/create', {
                session: req.session,
            });
        } else {
            res.redirect('/admin/login');
        }
    },

    store: function (req, res) {
        if (req.session.loggedin_admin) {
            let title = req.body.title;
            let description = req.body.description;

            let sql = `INSERT INTO thread_categories(title, description, created_at) VALUES (?, ?, NOW())`;

            Connection.query(sql, [title, description], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Kategori Thread baru berhasil disimpan.');
            res.redirect('/admin/thread-category');
        } else {
            res.redirect('/admin/login');
        }


    },

    edit: function (req, res) {
        if (req.session.loggedin_admin) {
            let id = req.params.id;

            let sql = `SELECT * from thread_categories where id = ?`;

            Connection.query(sql, [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                if (results.length > 0) {
                    res.render('backend/thread_category/edit', {
                        session: req.session,
                        result: results,
                    });
                }
            });
        } else {
            res.redirect('/admin/login');
        }


    },

    update: function (req, res) {
        if (req.session.loggedin_admin) {
            let id = req.params.id;

            let title = req.body.title;
            let description = req.body.description;

            let sql = `UPDATE thread_categories SET title = ?, description = ? where id = ?`;

            Connection.query(sql, [title, description, id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Kategori Thread berhasil diubah.');
            res.redirect('/admin/thread-category');
        } else {
            res.redirect('/admin/login');
        }


    },

    destroy: function (req, res) {
        if (req.session.loggedin_admin) {
            var id = req.params.id;

            Connection.query('DELETE FROM thread_categories where id = ?', [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Kategori Thread berhasil dihapus.');
            res.redirect('/admin/thread-category');
        } else {
            res.redirect('/admin/login');
        }


    }
}