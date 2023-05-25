import { Connection } from '../../config/connection.js';

export const DashboardController = {
    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `select (select count(id) from threads) as thread_count,
            (select count(id) from threads where date(created_at)  = CURRENT_DATE()) as thread_today_count,
            (select count(id) from users) as user_count,
            (select count(id) from users where date(created_at) = CURRENT_DATE()) as user_today_count`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists

                if (results.length > 0) {
                    res.render('backend/index', {
                        session: req.session,
                        stat: results[0],
                    });
                }
            });
        } else {
            res.redirect('/admin/login');
        }

    },
}