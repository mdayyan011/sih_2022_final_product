const constants = require('../config/constant');
var mysql = require('mysql2');
const pool = require('../config/connection_pool');
const utility = require('../helpers/utility');

//**********************  I  N  S  E  R  T  **********************

exports.insertSingle = async (table, param) => {
  let sql = 'INSERT INTO ?? SET ?';
  await pool.query('master_common_db', sql, [table, param]).catch(console.log);
};

//**********************  S E L E C T  **********************

exports.getAllUserDataByEmail = async (general_user_email) => {
  let sql =
    'SELECT * FROM general_customer WHERE general_user_email=? AND is_active=1 AND is_delete=0';
  let result = await pool
    .query('master_common_db', sql, [general_user_email])
    .catch(console.log);
  if (!utility.checkEmpty(result)) {
    result = result[0];
  }
  return result;
};
exports.getLanguageId = async (lang_in_words) => {
  let sql =
    'SELECT general_language_Id FROM general_language WHERE general_language_name=? ';
  let result = await pool
    .query('master_common_db', sql, [lang_in_words])
    .catch(console.log);
  if (!utility.checkEmpty(result)) {
    result = result[0];
  }
  return result;
};
