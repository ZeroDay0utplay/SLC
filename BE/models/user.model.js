const mongoose = require("mongoose");


const userSchema = {
    "email": {type: String, required: true},
    "password": {type: String, required: true},
    "fname": String,
    "lname": String,
    "test_letters": Map,
    "test_numbers": Map,
    "test_colors": Map,
    "isVerified": Boolean
};

const User = mongoose.model("User", userSchema);

module.exports = {User};