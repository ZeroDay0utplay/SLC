const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken")
//const cookieParser = require("cookie-parser");

const router = express.Router();
const asyncHandler = require('express-async-handler');

const {User} = require("../models/user.model.js");
const {Letter} = require("../models/tests.model.js");
const {handleErrors} = require("../middleware/handle_errors.js");
const {authorization, generateAccessToken} = require("../middleware/auth.js");

module.exports = {
    express,
    bodyParser,
    mongoose,
    jwt,
    router,
    asyncHandler,
    User,
    Letter,
    bcrypt,
    handleErrors,
    authorization,
    generateAccessToken
};