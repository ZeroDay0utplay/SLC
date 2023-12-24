const mongoose = require("mongoose");

const lettersSchema = {
    _id: String,
    "nb_tests": Number,
    "accuracy": Number,
};

const Letter = mongoose.model("Letter", lettersSchema);

module.exports = {Letter};