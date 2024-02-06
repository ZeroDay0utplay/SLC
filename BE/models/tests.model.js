const mongoose = require("mongoose");

const lettersSchema = {
    _id: String,
    "nb_tests": Number,
    "accuracy": Number,
};

const numbersSchema = {
    _id: String,
    "nb_tests": Number,
    "accuracy": Number,
};

const colorsSchema = {
    _id: String,
    "nb_tests": Number,
    "accuracy": Number,
};

const Letter = mongoose.model("Letter", lettersSchema);
const Color = mongoose.model("Color", colorsSchema);
const Nombre = mongoose.model("Nombre", numbersSchema);

module.exports = {Letter, Color, Nombre};