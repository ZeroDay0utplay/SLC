require("dotenv").config();
const {mongoose, express, bodyParser} = require("./middleware/exports.js");

mongoose.connect('mongodb+srv://'+process.env.DB_USER+':'+process.env.DB_PWD+'@slc.0k2gjej.mongodb.net/?retryWrites=true&w=majority&appName=SLC');

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
const isVerified = require("./routes/isVerified.js");
const resetPWDlink = require("./routes/reset.pwd.link.route.js");
const resetPWD = require("./routes/reset.pwd.route.js");
const sendMFP = require("./routes/sendMFP.route.js");


app.use("/", root);
app.use('/login', login);
app.use('/register', register);
app.use("/learn", learn);
app.use("/test", test);
app.use("/save_test", save_test);
app.use('/verify-email/:id/:token', verifyEmail);
app.use("/resend", resendEmailVerif);
app.use("/is-verified", isVerified);
app.use('/api/users/reset-pwd/:id/:token', resetPWDlink);
app.use("/resetPwd", resetPWD);
app.use("/sendMFA", sendMFP);


app.listen(process.env.PORT, () => {
 console.log('Server started on port 3000');
});