const {router, User} = require("../middleware/exports");

router.post("/isVerified", async (req, res) => {
    const email = req.body.email;
    try {
        const user = await User.findOne({"email": email});
        if (user) {
            // while 1 in front with sleep of 500ms
            if (user.isVerified) res.status(200).json({message: "Your account has been successfully verified"});
            return res.status(401).json({message: "Your account has not been verified yet"});
        }
        return res.status(404).json({message: "User not found"});
    } catch (err) {
        return res.status(500).json({message: "Failed to verify account"});
    }
});

module.exports = router;