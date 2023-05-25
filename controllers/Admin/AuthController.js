import { Connection } from '../../config/connection.js';

export const AuthController = {
    login: function (req, res) {
        const msgSuccess = req.flash('msgSuccess');
        const msgError = req.flash('msgError');
        res.render('backend/auth/login', {
            session: req.session,
            msgError: msgError,
            msgSuccess: msgSuccess
        });
    },


    postLogin: function (req, res) {
        // Capture the input fields
        let username = req.body.username;
        let password = req.body.password;
        // Ensure the input fields exists and are not empty
        if (username && password) {
            // Execute SQL query that'll select the account from the database based on the specified username and password
            Connection.query('SELECT * FROM users WHERE email = ? AND password = MD5(?) AND role_id = 2', [username, password], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists
                if (results.length > 0) {
                    // Authenticate the user
                    req.session.loggedin_admin = true;
                    req.session.user_id_admin = results[0].id;
                    req.session.username_admin = username;
                    // Redirect to home page
                    res.redirect('/admin/dashboard');
                } else {
                    req.flash('msgError', 'Username atau Password anda salah');
                    res.redirect('/admin/login');
                }
                res.end();
            });
        } else {
            req.flash('msgError', 'Masukkan Username atau Password anda');
            res.redirect('/admin/login');
            res.end();
        }
    },

    logout: function (req, res) {
        // If the user is loggedin
        if (req.session.loggedin) {
            delete req.session.loggedin_admin;
            delete req.session.user_id_admin;
            delete req.session.username_admin;
            res.redirect('/');
        } else {
            // Not logged in
            res.redirect('/admin/login');
        }
        res.end();
    }
}