const mongoose = require("mongoose");

const userSchema = {
    "email": {type: String, required: true},
    "password": {type: String, required: true},
    "name": String,
    "age": Number
};

const User = mongoose.model("User", userSchema);

module.exports = {User};