const {router, handleErrors, generateAccessToken, asyncHandler, User, bcrypt} = require("../middleware/exports");



router.post('/login', handleErrors(asyncHandler(async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });

    if (!user) {
        return res.status(400).json({ message: "User does not exist" });
    }
    const userPWD = await user.password;
    const isMatch = bcrypt.compareSync(password, userPWD);

    if (!isMatch) {
        return res.status(400).json({ message: "Invalid password" });
    }
    const token = generateAccessToken((user._id).toString());
    //res.setHeader('Content-Type', 'application/json');
    res.cookie('token', token, { httpOnly: true })
       .status(200)
       .json({ message: "Logged in successfully"});
})));

module.exports = router;