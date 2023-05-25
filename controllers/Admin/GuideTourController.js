import { Connection } from '../../config/connection.js';

export const GuideTourController = {
    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `SELECT guide_tours.*, name from guide_tours left join cities on guide_tours.city_id = cities.id order by created_at desc`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists


                res.render('backend/guide_tour/index', {
                    session: req.session,
                    guide_tour_list: results,
                });

            });
        } else {
            res.redirect('/admin/login');
        }
    },

    create: function (req, res) {

        if (req.session.loggedin_admin) {
            const getCity = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from cities`, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const async_function = async () => {
                const cityData = await getCity();

                let city_list = JSON.parse(JSON.stringify(cityData));

                res.render('backend/guide_tour/create', {
                    session: req.session,
                    city_list
                });
            }

            async_function();
        } else {
            res.redirect('/admin/login');
        }
    },

    store: function (req, res) {

        if (req.session.loggedin_admin) {
            let location = req.body.location;
            let city_id = req.body.city_id;
            let content = req.body.content;
            let budget_min = req.body.budget_min;
            let budget_max = req.body.budget_max;

            let sql = `INSERT INTO guide_tours(location, city_id, content, budget_min, budget_max, created_at) VALUES (?, ?, ? ,? ,?, NOW())`;

            Connection.query(sql, [location, city_id, content, budget_min, budget_max], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Guide Tour berhasil disimpan.');
            res.redirect('/admin/guide-tour');
        } else {
            res.redirect('/admin/login');
        }
    },

    edit: function (req, res) {

        if (req.session.loggedin_admin) {

            let id = req.params.id;

            const getCity = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from cities`, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }


            const getGuideTour = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from guide_tours where id = ?`, [id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const async_function = async () => {
                const cityData = await getCity();
                const guideTourData = await getGuideTour();

                let city_list = JSON.parse(JSON.stringify(cityData));
                let guide_tour = JSON.parse(JSON.stringify(guideTourData));

                console.log(guide_tour);

                res.render('backend/guide_tour/edit', {
                    session: req.session,
                    city_list,
                    result: guide_tour[0]
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

            let location = req.body.location;
            let city_id = req.body.city_id;
            let content = req.body.content;
            let budget_min = req.body.budget_min;
            let budget_max = req.body.budget_max;

            let sql = `UPDATE guide_tours SET location = ?, city_id = ?, content = ?, budget_min = ?, budget_max = ? where id = ?`;

            Connection.query(sql, [location, city_id, content, budget_min, budget_max, id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Guide Tour berhasil diubah.');
            res.redirect('/admin/guide-tour');
        } else {
            res.redirect('/admin/login');
        }


    },

    destroy: function (req, res) {
        if (req.session.loggedin_admin) {
            var id = req.params.id;

            Connection.query('DELETE FROM guide_tours where id = ?', [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Guide Tour berhasil dihapus.');
            res.redirect('/admin/guide-tour');
        } else {
            res.redirect('/admin/login');
        }
    }
}