import { Connection } from '../../config/connection.js';

export const TourByBudgetController = {
    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `SELECT * from tour_by_budgets order by created_at desc`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists


                res.render('backend/tour_by_budget/index', {
                    session: req.session,
                    tour_by_budget_list: results,
                });

            });
        } else {
            res.redirect('/admin/login');
        }
    },

    create: function (req, res) {

        if (req.session.loggedin_admin) {

            const async_function = async () => {
                res.render('backend/tour_by_budget/create', {
                    session: req.session
                });
            }

            async_function();
        } else {
            res.redirect('/admin/login');
        }
    },

    store: function (req, res) {
        if (req.session.loggedin_admin) {
            let title = req.body.title;
            let description = req.body.description;
            let budget_min = req.body.budget_min;
            let budget_max = req.body.budget_max;

            let sql = `INSERT INTO tour_by_budgets(title, description, budget_min, budget_max, created_at) VALUES (?, ?, ? ,? , NOW())`;

            Connection.query(sql, [title, description, budget_min, budget_max], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Tour By Budget berhasil disimpan.');
            res.redirect('/admin/tour-by-budget');
        } else {
            res.redirect('/admin/login');
        }
    },

    edit: function (req, res) {

        if (req.session.loggedin_admin) {

            let id = req.params.id;


            const getTourByBudget = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from tour_by_budgets where id = ?`, [id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const async_function = async () => {
                const tourByBudgetData = await getTourByBudget();

                let tour_by_budget = JSON.parse(JSON.stringify(tourByBudgetData));

                console.log(tour_by_budget);

                res.render('backend/tour_by_budget/edit', {
                    session: req.session,
                    result: tour_by_budget[0]
                });
            }

            async_function();
        } else {
            res.redirect('/admin/login');
        }

    },

    update: function (req, res) {
        if (req.session.loggedin_admin) {
            let id = req.params.id;

            let title = req.body.title;
            let description = req.body.description;
            let budget_min = req.body.budget_min;
            let budget_max = req.body.budget_max;

            let sql = `UPDATE tour_by_budgets SET title = ?, description = ?, budget_min = ?, budget_max = ? where id = ?`;

            Connection.query(sql, [title, description, budget_min, budget_max, id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Tour By Budget berhasil diubah.');
            res.redirect('/admin/tour-by-budget');
        } else {
            res.redirect('/admin/login');
        }


    },

    destroy: function (req, res) {
        if (req.session.loggedin_admin) {
            var id = req.params.id;

            Connection.query('DELETE FROM tour_by_budgets where id = ?', [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Tour By Budget berhasil dihapus.');
            res.redirect('/admin/tour-by-budget');
        } else {
            res.redirect('/admin/login');
        }
    }
}