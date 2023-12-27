const mongoose = require("mongoose");


const tokenSchema = {
    "userId": String,
    "token": String
};

const Token = mongoose.model("Token", tokenSchema);

module.exports = {Token};