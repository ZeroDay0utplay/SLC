const {router, User, bcrypt, generateAccessToken} = require("../middleware/exports");
const validator = require("validator");
const crypto = require("crypto");
const sendMail = require("../middleware/sendMail");


router.post("/register", async (req, res)=>{
   try{
    const {email, password, fname, lname} = req.body;
    if (!(validator.isEmail(email))) return res.status(408).json({"message": "Invalid email address"});
    const userExists = await User.findOne({ email: email });
    if (userExists) {
        return res.status(411).json({ errors: [{ msg: 'User already exists' }] });
    }
    // Create new user
    const hashedPassword = bcrypt.hashSync(password, 10);

    const user = new User({
        "email": email,
        "password": hashedPassword,
        "fname": fname,
        "lname": lname,
        "isVerified": false,
        "reqPwdChange": false,
    });
    await user.save();
    if (user) {
        let setToken = generateAccessToken(crypto.randomBytes(16).toString("hex"), 1);
        if (setToken) {
            sendMail({
            from: process.env.EMAIL,
            to: `${email}`,
            subject: "Account Verification Link",
            text: `Hello, ${fname} ${lname} Please verify your email by clicking this link :
                    http://192.168.1.3:3000/api/users/verify-email/${user._id}/${setToken} `,
            })

        } else {
            return res.status(400).send("token not created");
        }
        return res.status(200).json({"message": "User registered successfully"});
    }
    return res.status(409).send("Details are not correct");
   } catch (err) {
      return res.status(500).json({message: "Internal Server Error"});
  }
});


module.exports = router;