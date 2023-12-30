const {User, router} = require("../middleware/exports");
const jwt = require("jsonwebtoken");

router.get('/api/users/reset-pwd/:id/:token', async (req, res) => {
    try {
      const token = (req.params.token).toString();

      jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
        if (err !== null && err.name === 'TokenExpiredError'){
            return res.status(403).json({ message: 'Your verification link may have expired' });
        }
      });

      const user = await User.findById(req.params.id);
      if (!user)
        return res.status(401).json({
            msg: "We were unable to find a user for this verification. Please SignUp!",
          }
        );

      else{
        user["reqPwdChange"] = true;
        await user.save();
        return res
          .status(200)
          .json({message: "Now go back to the app and change your password"});
      }

      }catch (err) {
        return res.status(500).json({message: "Internal Server Error"});
    }
  }
);

module.exports = router;