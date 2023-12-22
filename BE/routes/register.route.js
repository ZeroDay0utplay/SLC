const {router, User, bcrypt} = require("../middleware/exports");
const validator = require("validator");


router.post("/register", async (req, res)=>{
    const {email, password, name, age} = req.body;
    if (!(validator.isEmail(email))) return res.status(400).json({"message": "Invalid email address"});
    const userExists = await User.findOne({ email: email });
    if (userExists) {
        return res.status(400).json({ errors: [{ msg: 'User already exists' }] });
    }
    // Create new user
    const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(password, 10);

    const user = new User({
        email,
        password: hashedPassword,
        name,
        age
    });
    await user.save();
    return res.status(200).json({"message": "User registered successfully"});
});


module.exports = router;