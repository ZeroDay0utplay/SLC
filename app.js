// Include required dependencies
require("dotenv").config();
const {mongoose, express, bodyParser} = require("./middleware/exports.js");

// Connect to MongoDB database
mongoose.connect('mongodb+srv://'+process.env.DB_USER+':'+process.env.DB_PWD+'@cluster0.7aitjvf.mongodb.net/slc');

// Create Express app
const app = express();

// Use body-parser middleware to parse JSON data from the client
app.use(bodyParser.json());

// Include API routes
const login = require("./routes/login.route.js");
const root = require("./routes/root.route.js");
const register = require("./routes/register.route.js");

app.use("/", root);
app.use('/login', login);
app.use('/register', register);




app.listen(3000, () => {
 console.log('Server started on port 3000');
});