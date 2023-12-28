const {router, User, generateAccessToken} = require("../middleware/exports");
const crypto = require("crypto");
const sendMail = require("../middleware/sendMail");


router.post("/resend", async (req, res)=>{
    const user = await User.findOne({"email": req.body.email});
    if (user) {
        const email = user.email;
        const fname = user.fname;
        const lname = user.lname;
        let setToken = generateAccessToken(crypto.randomBytes(16).toString("hex"), 10);
        if (setToken) {
            sendMail({
            from: process.env.EMAIL,
            to: `${email}`,
            subject: "Account Verification Link",
            text: `Hello, ${fname} ${lname} Please verify your email by
                    clicking this link :
                    http://192.168.1.3:3000/api/users/verify-email/${user._id}/${setToken} `,
            })

        } else {
            return res.status(400).send("token not created");
        }
        return res.status(200).json({"message": "Email Verification has been resent successfully"});
    }
    return res.status(409).send("Details are not correct");
});


module.exports = router;