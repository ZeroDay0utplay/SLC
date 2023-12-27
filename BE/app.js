require("dotenv").config();
const {mongoose, express, bodyParser} = require("./middleware/exports.js");

mongoose.connect('mongodb+srv://'+process.env.DB_USER+':'+process.env.DB_PWD+'@cluster0.7aitjvf.mongodb.net/slc');

const app = express();

app.use(bodyParser.json());

const login = require("./routes/login.route.js");
const root = require("./routes/root.route.js");
const register = require("./routes/register.route.js");
const learn = require("./routes/learn.route.js");
const test = require("./routes/test.route.js");
const save_test = require("./routes/save.test.route.js");
const verifyEmail = require("./routes/verify.mail.route.js");
const resendEmailVerif = require("./routes/resend.verif.js");


app.use("/", root);
app.use('/login', login);
app.use('/register', register);
app.use("/learn", learn);
app.use("/test", test);
app.use("/save_test", save_test);
app.use('/verify-email/:id/:token', verifyEmail);
app.use("/resend", resendEmailVerif);


app.listen(3000, () => {
 console.log('Server started on port 3000');
});