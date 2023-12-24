const mongoose = require("mongoose");


const userSchema = {
    "email": {type: String, required: true},
    "password": {type: String, required: true},
    "name": String,
    "age": Number,
    "test_letters": Map,
    "test_numbers": Map,
    "test_colors": Map,
};

const User = mongoose.model("User", userSchema);

module.exports = {User};