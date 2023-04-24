import { Connection } from '../config/connection.js';


export const Index = (req, res) => {
    res.render('index', {
        session: req.session
    });
}

// About Page
export const About = (req, res) => {

    Connection.query(`select * from settings where setting_name = 'about'`, function (error, results, fields) {
        // If there is an issue with the query, output the error
        if (error) throw error;
        // If the account exists

        res.render('about', {
            session: req.session,
            page_about: results[0],
        });
    });
}

// Contact page
export const Register = (req, res) => {
    if (req.session.loggedin) {
        res.redirect('/');
    } else {
        const msgError = req.flash('msgError');
        res.render('register', {
            session: req.session,
            msgError: msgError
        });
    }
}


// Register Process
export const PostRegister = (req, res) => {
    // Capture the input fields
    let name = req.body.name;
    let password = req.body.password;
    let password_confirm = req.body.password_confirmation;
    let email = req.body.email;

    if (!name) {
        req.flash('msgError', 'Masukkan Nama Anda');
        res.redirect('/register');
    }

    if (!email) {
        req.flash('msgError', 'Masukkan Email Anda');
        res.redirect('/register');
    }

    if (!password) {
        req.flash('msgError', 'Masukkan Password Anda');
        res.redirect('/register');
    }

    if (!password_confirm) {
        req.flash('msgError', 'Masukkan Konfirmasi Password Anda');
        res.redirect('/register');
    }

    if (password.length < 8) {
        req.flash('msgError', 'Password minimal berisi 8 karakter');
        res.redirect('/register');
    }

    if (password != password_confirm) {
        req.flash('msgError', 'Konfirmasi Password tidak sama dengan Password');
        res.redirect('/register');
    }

    Connection.query('SELECT * FROM users WHERE email = ?', [email], function (error, results, fields) {
        // If there is an issue with the query, output the error
        if (error) throw error;
        // If the account exists
        if (results.length > 0) {
            req.flash('msgError', 'Email sudah ada sebelumnya');
            res.redirect('/register');
        }
    });

    Connection.query('INSERT INTO users(name, email, password, role_id, created_at) VALUES (?, ?, MD5(?), 1, NOW())', [name, email, password], function (error, results, fields) {
        // If there is an issue with the query, output the error
        if (error) throw error;
    });

    req.flash('msgSuccess', 'Register berhasil. Silakan login.');
    res.redirect('/login');
}

// Login page
export const Login = (req, res) => {
    if (req.session.loggedin) {
        res.redirect('/');
    } else {
        const msgSuccess = req.flash('msgSuccess');
        const msgError = req.flash('msgError');
        res.render('login', {
            session: req.session,
            msgError: msgError,
            msgSuccess: msgSuccess
        });
    }
}

// Login Process
export const PostLogin = (req, res) => {
    // Capture the input fields
    let username = req.body.username;
    let password = req.body.password;
    // Ensure the input fields exists and are not empty
    if (username && password) {
        // Execute SQL query that'll select the account from the database based on the specified username and password
        Connection.query('SELECT * FROM users WHERE email = ? AND password = MD5(?) AND role_id = 1', [username, password], function (error, results, fields) {
            // If there is an issue with the query, output the error
            if (error) throw error;
            // If the account exists
            if (results.length > 0) {
                // Authenticate the user
                req.session.loggedin = true;
                req.session.user_id = results[0].id;
                req.session.username = username;
                // Redirect to home page
                res.redirect('/');
            } else {
                req.flash('msgError', 'Username atau Password anda salah');
                res.redirect('/login');
            }
            res.end();
        });
    } else {
        req.flash('msgError', 'Masukkan Username atau Password anda');
        res.redirect('/login');
        res.end();
    }
}

export const Logout = (req, res) => {
    // If the user is loggedin
    if (req.session.loggedin) {
        delete req.session.loggedin;
        delete req.session.username;
        res.redirect('/');
    } else {
        // Not logged in
        res.redirect('/login');
    }
    res.end();
}