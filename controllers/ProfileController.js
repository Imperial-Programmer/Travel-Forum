import { Connection } from '../config/connection.js';
import formidable from 'formidable';
import fs from 'fs';

export const ProfileController = {
    index: function (req, res) {
        if (req.session.loggedin) {
            const getStat = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`select (select count(id) from threads where user_id = ?) as thread_count,
                    (select count(id) from thread_replies where user_id = ?) as thread_reply_count`, [req.session.user_id, req.session.user_id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results[0]);
                    });
                });
            }

            const getProfile = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`select *, date_format(birth_date, '%Y-%m-%d') as date_birth from users where id = ?`, [req.session.user_id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results[0]);
                    });
                });
            }

            const async_function = async () => {
                const statData = await getStat();
                const profileData = await getProfile();

                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('profile', {
                    session: req.session,
                    stat: statData,
                    profile: profileData,
                    msgSuccess,
                    msgError
                });
            }

            async_function();

        } else {
            res.redirect('/login');
        }
    },

    changeProfile: function (req, res) {
        const msgSuccess = req.flash('msgSuccess');
        const msgError = req.flash('msgError');

        if (req.session.loggedin) {
            let name = req.body.name;
            let email = req.body.email;
            let phone = req.body.phone;
            let address = req.body.address;
            let birth_place = req.body.birth_place;
            let birth_date = req.body.birth_date;

            let sql = `UPDATE users SET name = ?, email = ?, phone = ?, address = ?, birth_place = ?, birth_date = ? where id = ?`;

            Connection.query(sql, [name, email, phone, address, birth_place, birth_date, req.session.user_id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Profil Berhasil diubah.');
            res.redirect('/profile');
        } else {
            res.render('login', {
                session: req.session,
                msgError: msgError,
                msgSuccess: msgSuccess
            });
        }
    },

    changePassword: function (req, res) {
        const msgSuccess = req.flash('msgSuccess');
        const msgError = req.flash('msgError');

        if (req.session.loggedin) {
            let old_pass = req.body.old_pass;
            let new_pass = req.body.new_pass;
            let new_pass_confirm = req.body.new_pass_confirm;

            if (new_pass != new_pass_confirm) {
                req.flash('msgError', 'Konfirmasi Password tidak sama dengan Password Baru');
                res.redirect('/profile');
            } else {
                let sql = `SELECT * FROM users where id = ? AND password = MD5(?)`;

                Connection.query(sql, [req.session.user_id, old_pass], function (error, results, fields) {
                    // If there is an issue with the query, output the error
                    if (error) throw error;

                    if (results.length > 0) {
                        let sql_change = `update users set password = MD5(?) where id = ?`;

                        Connection.query(sql_change, [new_pass, req.session.user_id], function (error, results, fields) {
                            if (error) throw error;

                            req.flash('msgSuccess', 'Password Berhasil diubah.');
                            res.redirect('/profile');
                        });
                    } else {
                        req.flash('msgError', 'Password Lama anda salah');
                        res.redirect('/profile');
                    }
                });
            }
        } else {
            res.render('login', {
                session: req.session,
                msgError: msgError,
                msgSuccess: msgSuccess
            });
        }
    },

    changePhoto: function (req, res) {
        const msgSuccess = req.flash('msgSuccess');
        const msgError = req.flash('msgError');

        if (req.session.loggedin) {
            // membuat objek form dari formidable
            var form = new formidable.IncomingForm();

            // manangani upload file
            form.parse(req, function (err, fields, files) {
                console.log(files);
                var oldpath = files.photofiles.filepath;
                var newpath = "public/profile_picture/" + files.photofiles.originalFilename;

                var rawData = fs.readFileSync(oldpath);

                // pindahakan file yang telah di-upload
                fs.writeFile(newpath, rawData, function (err) {
                    if (err) { throw err; } else {
                        let sql = `update users set photo = ? where id = ?`;

                        Connection.query(sql, [files.photofiles.originalFilename, req.session.user_id], function (error, results, fields) {
                            if (error) throw error;

                            req.flash('msgSuccess', 'Foto profil berhasil diubah.');
                            res.redirect('/profile');
                        });
                    }
                });
            });
        } else {
            res.render('login', {
                session: req.session,
                msgError: msgError,
                msgSuccess: msgSuccess
            });
        }
    }
}