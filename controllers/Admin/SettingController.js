import { Connection } from '../../config/connection.js';

export const SettingController = {
    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `SELECT * from settings where setting_name = 'about'`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists


                res.render('backend/setting/index', {
                    session: req.session,
                    about_result: results[0],
                });

            });
        } else {
            res.redirect('/admin/login');
        }
    },

    saveAbout: function (req, res) {
        if (req.session.loggedin_admin) {
            let setting_value = req.body.setting_value;

            let sql = `UPDATE settings SET setting_value = ? where setting_name = 'about'`;

            Connection.query(sql, [setting_value], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Setting berhasil diubah.');
            res.redirect('/admin/setting');
        } else {
            res.redirect('/admin/login');
        }

    },
}