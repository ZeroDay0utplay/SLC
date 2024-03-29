const {router, handleErrors, generateAccessToken, asyncHandler, User, bcrypt} = require("../middleware/exports");



router.post('/login', handleErrors(asyncHandler(async (req, res) => {
    try{
        const { email, password } = req.body;
        const user = await User.findOne({ email: email });

        if (!user) {
            return res.status(400).json({ message: "User does not exist" });
        }
        if (!(user.isVerified)) return res.status(411).json({ message: "Verify your account" }); // redirect to verif page
        const userPWD = await user.password;
        const isMatch = bcrypt.compareSync(password, userPWD);

        if (!isMatch) {
            return res.status(407).json({ message: "Invalid password" });
        }
        const token = generateAccessToken((user._id).toString(), 90);
        res.setHeader('Content-Type', 'application/json');
        return res.status(200).json({ auth_token: token, message: "Logged in successfully"});
    } catch (err) {
        return res.status(500).json({message: "Internal Server Error"});
    }
})));

module.exports = router;