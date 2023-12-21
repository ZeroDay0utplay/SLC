const mongoose = require("mongoose");

const userSchema = {
    "letter": String,
    "sound": String
};

const User = mongoose.model("User", userSchema);

module.exports = {User};