const express = require('express');
const middlewares_obj = require('../middlewares/middlewares');
const usercontrollers = require('../controllers/userController');
 
var app = express();
 

app.use(middlewares_obj);

// general user
app.use('/user/registration', usercontrollers.globalRegistration);
app.use('/user/login', usercontrollers.globalLogin);
// app.use('/user/editmobile', usercontrollers.editMobile);
// app.use('/user/verifymobile', usercontrollers.verifyMobile);
// app.use('/user/resendotp', usercontrollers.resendOTP);
// app.use('/user/forgotpassword', usercontrollers.forgotPassword);
// app.use('/user/changepassword', usercontrollers.changePassword);  
// app.use('/user/basicdata', usercontrollers.getUserDetails);
// app.use('/user/getUserList', usercontrollers.getUserList); 
 

module.exports = app;

//need to make a route for sending notification and call from here.
