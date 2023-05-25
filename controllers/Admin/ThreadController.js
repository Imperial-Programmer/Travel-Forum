import { Connection } from '../../config/connection.js';

export const ThreadController = {

    index: function (req, res) {
        if (req.session.loggedin_admin) {
            let sql = `SELECT c.id, c.title, name, c.title as category_title, DATE_FORMAT(c.created_at, '%d %M %Y %H:%i') as thread_created_at from threads c inner join users u on c.user_id = u.id left join thread_categories t on c.thread_category_id = t.id order by c.created_at desc`;

            Connection.query(sql, function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
                // If the account exists


                res.render('backend/thread/index', {
                    session: req.session,
                    thread_list: results,
                });

            });
        } else {
            res.redirect('/admin/login');
        }


    },

    show: function (req, res) {

    },

    destroy: function (req, res) {
        if (req.session.loggedin_admin) {
            var id = req.params.id;

            Connection.query('DELETE FROM threads where id = ?', [id], function (error, results, fields) {
                // If there is an issue with the query, output the error
                if (error) throw error;
            });

            req.flash('msgSuccess', 'Thread berhasil dihapus.');
            res.redirect('/admin/thread');


        } else {
            res.redirect('/admin/login');
        }
    }
}