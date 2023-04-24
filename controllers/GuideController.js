import { Connection } from '../config/connection.js';

export const GuideController = {
    index: function (req, res) {
        if (req.session.loggedin) {

            const getProvince = () => {
                return new Promise(function (resolve, reject) {
                    Connection.query(`SELECT * from provinces`, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const getGuideList = () => {
                let sql = `SELECT guide_tours.*, cities.name as city_name, provinces.name as province_name from guide_tours left join cities on guide_tours.city_id = cities.id left join provinces on cities.province_id = provinces.id order by created_at desc`;

                return new Promise(function (resolve, reject) {
                    Connection.query(sql, function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results);
                    });
                });
            }

            const async_function = async () => {
                const guideData = await getGuideList();
                const provinceData = await getProvince();

                let guide_list = JSON.parse(JSON.stringify(guideData));
                let province_list = JSON.parse(JSON.stringify(provinceData));

                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('guide/index', {
                    session: req.session,
                    guide_list,
                    province_list,
                    msgError: msgError,
                    msgSuccess: msgSuccess
                });
            }

            async_function();

        } else {
            res.redirect('/login');
        }

    },


    getCity: function (req, res) {
        let province = req.query.province;

        let sql = `SELECT * from cities where province_id = ?`
        Connection.query(sql, [province], function (error, results, fields) {
            // If there is an issue with the query, output the error
            if (error) throw error;
            // If the account exists

            res.json(results);
        });
    },

    getData: function (req, res) {
        var draw = req.query.draw;

        var start = req.query.start;

        var length = req.query.length;

        var order_data = req.query.order;

        var province = req.query.province;
        var city = req.query.city;
        var budget = req.query.budget;

        console.log(budget);


        if (typeof order_data == 'undefined') {
            var column_name = 'guide_tours.id';

            var column_sort_order = 'desc';
        }
        else {
            var column_index = req.query.order[0]['column'];

            var column_name = req.query.columns[column_index]['data'];

            var column_sort_order = req.query.order[0]['dir'];
        }

        //search data

        var search_value = req.query.search['value'];

        var search_query = `(location LIKE '%${search_value}%' OR content LIKE '%${search_value}%')`;

        if (province) {
            var province_query = `AND cities.province_id = ${province}`;
        } else {
            var province_query = ``;
        }

        if (city) {
            var city_query = `AND cities.id = ${city}`;
        } else {
            var city_query = ``;
        }

        if (budget) {
            var budget_query = `AND (budget_min > ${budget} AND budget_max <= ${budget})`;
        } else {
            var budget_query = ``;
        }

        //Total number of records without filtering

        Connection.query("SELECT COUNT(id) AS Total FROM guide_tours", function (error, data) {

            var total_records = data[0].Total;

            //Total number of records with filtering

            Connection.query(`SELECT COUNT(id) AS Total FROM guide_tours WHERE ${search_query}`, function (error, data) {

                var total_records_with_filter = data[0].Total;

                var query = `
                SELECT guide_tours.*, cities.name as city_name, provinces.name as province_name from guide_tours left join cities on guide_tours.city_id = cities.id left join provinces on cities.province_id = provinces.id  WHERE ${search_query} ${province_query} ${city_query} ${budget_query} ORDER BY ${column_name} ${column_sort_order} 
                LIMIT ${start}, ${length}
                `;

                console.log(query);

                var data_arr = [];

                Connection.query(query, function (error, data) {

                    data.forEach(function (row) {
                        data_arr.push({
                            'id': row.id,
                            'location': row.location,
                            'province_name': row.province_name,
                            'city_name': row.city_name,
                            'budget_min': row.budget_min,
                            'budget_max': row.budget_max,
                        });
                    });

                    var output = {
                        'draw': draw,
                        'iTotalRecords': total_records,
                        'iTotalDisplayRecords': total_records_with_filter,
                        'aaData': data_arr
                    };

                    res.json(output);

                });

            });

        });
    },

    detail: function (req, res) {

        var id = req.params.id;

        if (req.session.loggedin) {

            let sql = `SELECT guide_tours.*, cities.name as city_name, provinces.name as province_name from guide_tours left join cities on guide_tours.city_id = cities.id left join provinces on cities.province_id = provinces.id where guide_tours.id = ?`;

            const getGuideDetail = (id) => {
                return new Promise(function (resolve, reject) {
                    Connection.query(sql, [id], function (error, results, fields) {
                        // If there is an issue with the query, output the error
                        if (error) throw reject(error);
                        // If the account exists

                        resolve(results[0]);
                    });
                });
            }

            const async_function = async () => {
                const guideDetailData = await getGuideDetail(id);

                const msgSuccess = req.flash('msgSuccess');
                const msgError = req.flash('msgError');

                res.render('guide/detail', {
                    session: req.session,
                    guide_detail: guideDetailData,
                    msgError: msgError,
                    msgSuccess: msgSuccess
                });
            }

            async_function();
        } else {
            res.redirect('/login');
        }
    }
}