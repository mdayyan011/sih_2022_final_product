const utility = require('../helpers/utility');
const dbquery = require('../helpers/query.js');
const methods = require('../helpers/method');
const dbcon = require('../config/connection_pool');
const constants = require('../config/constant');

exports.globalRegistration = async (req, res) => {
  let response = {};
  if (utility.checkEmpty(constants.dbconn)) {
    constants.dbconn = await dbcon.connection().catch((e) => {
      console.log(e);
    });
  }
  const input = req.body;
  console.log(input);
  if (utility.checkEmpty(input)) {
    response['status'] = 'error';
    response['msg'] = 'Empty Input';
    return res.send(response);
  }

  const customer_fname = input.customer_fname;
  const customer_lname = input.customer_lname;
  const customer_email = input.customer_email;
  const customer_lang = input.customer_lang;
  // const cusotmer_mobile = input.customer_mobile;
  const customer_password = input.customer_password;
  const customer_dob = input.customer_dob;
  console.log(req.body); 
  //checking for empties
  if (utility.checkEmpty(customer_fname)) {
    response['status'] = 'error';
    response['msg'] = 'Empty First Name';
    return res.send(response);
  }

  if (utility.checkEmpty(customer_email)) {
    response['status'] = 'error';
    response['msg'] = 'Empty Customer Email';
    return res.send(response);
  }

  if (utility.checkEmpty(customer_password)) {
    response['status'] = 'error';
    response['msg'] = 'Empty Customer Password';
    return res.send(response);
  }
  if (utility.checkEmpty(customer_lang)) {
    response['status'] = 'error';
    response['msg'] = 'Empty Customer Preferred Language';
    return res.send(response);
  }

  if (utility.checkEmailFormat(customer_email)) {
    response['status'] = 'error';
    response['msg'] = 'Enter Correct Email';
    return res.send(response);
  }

  let email_duplicacy_data = await dbquery.getAllUserDataByEmail(
    customer_email
  );
  if (!utility.checkEmpty(email_duplicacy_data)) {
    response['status'] = 'error';
    response['msg'] = 'User with this email is already registered';
    return res.send(response);
  }
  let encryped_password = await utility.encryptData(customer_password);

  //extract language id from language table
  let language_Id = await dbquery.getLanguageId(customer_lang);

  if (utility.checkEmpty(language_Id)) {
    response['status'] = 'error';
    response['msg'] = 'User language id is empty';
    return res.send(response);
  }
  language_Id = language_Id.general_language_Id;
  // db, table, params;
  let params = {};
  params['general_user_first_name'] = customer_fname;
  params['general_user_last_name'] = customer_lname;
  params['general_user_email'] = customer_email;
  params['general_customer_password'] = encryped_password;
  params['general_user_language_Id'] = language_Id;
  params['general_user_dob'] = customer_dob;

  //pending customer image
  await dbquery.insertSingle('general_customer', params);

  response['status'] = 'success';
  response['msg'] = 'Registered';
  return res.send(response);
};

exports.globalLogin = async (req, res) => {
  try {
    if (utility.checkEmpty(constants.dbconn)) {
      constants.dbconn = await dbcon.connection().catch((e) => {
        console.log(e);
      });
    }
    let input = req.body.input;
    let customer_email = input.customer_email;
    let customer_password = input.customer_password;
    let response = {};
    if (utility.checkEmpty(customer_password)) {
      response['status'] = 'error';
      response['mssg'] = 'Enter password to login';
      return res.send(response);
    }
    if (utility.checkEmpty(customer_email)) {
      response['status'] = 'error';
      response['mssg'] = 'Enter email to login';
      return res.send(response);
    }

    let user_id = await methods.user_id(customer_email);
    let details = await dbquery.getAllUserDataByEmail(customer_email);
    if (utility.checkEmpty(details)) {
      response['status'] = 'error';
      response['msg'] = 'no_such_email_user';
      return res.send(response);
    }
    let authentication_status = await methods.authentication_status(
      customer_email,
      customer_password
    );
    if (!authentication_status) {
      response['status'] = 'error';
      response['msg'] = 'wrong_email_or_password';
      return res.send(response);
    }

    // console.log(details);
    let profile_pic = details.customer_image_url;
    let first_name = details.customer_customer_fname;
    response['status'] = 'success';
    response['msg'] = '';
    response['user_id'] = user_id;
    response['profile_pic'] = profile_pic;
    response['first_name'] = first_name;
    return res.send(response);
  } catch (error) {
    console.log(error);
  }
};
