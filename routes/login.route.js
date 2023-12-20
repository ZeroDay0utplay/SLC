const {router, handleErrors, generateAccessToken, asyncHandler, User} = require("../middleware/exports");



router.post('/login', handleErrors(asyncHandler(async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });

    if (!user) {
        return res.status(400).json({ message: "User does not exist" });
    }
    //const hashedPassword = await bcrypt.hash(password, 10);;
    const isMatch = await user.password == password;

    if (!isMatch) {
        return res.status(400).json({ message: "Invalid password" });
    }
    const token = generateAccessToken((user._id).toString());
    res.cookie('token', token, { httpOnly: true })
       .status(200)
       .json({ message: "Logged in successfully"});
})));

module.exports = router;