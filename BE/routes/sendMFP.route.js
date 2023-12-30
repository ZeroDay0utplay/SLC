const {router, User, generateAccessToken} = require("../middleware/exports");
const crypto = require("crypto");
const sendMail = require("../middleware/sendMail");


router.post("/sendMFP", async (req, res)=>{
    const user = await User.findOne({email: req.body.email});
    if (!user) return res.status(400).json({ message: "User does not exist" });
    let setToken = generateAccessToken(crypto.randomBytes(16).toString("hex"), 1);
    if (setToken) {
        const {email, fname, lname} = user;
        sendMail({
            from: process.env.EMAIL,
            to: `${email}`,
            subject: "Password Reset Link",
            text: `Hello, ${fname} ${lname} Please reset your password by clicking this link :
            http://192.168.1.3:3000/api/users/reset-pwd/${user._id}/${setToken} `,
        });
        return res.status(200).json({message: "Password link has been sent successfully"});
    }
    else return res.status(400).json("token not created");
})

module.exports = router;