const {User, router} = require("../middleware/exports");
const jwt = require("jsonwebtoken");

router.get('/api/users/verify-email/:id/:token', async (req, res) => {
    try {
      const token = (req.params.token).toString();

      jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
        if (err !== null && err.name === 'TokenExpiredError'){
            if (usertoken){
                usertoken.deleteOne({userId: req.params.id});
            }
            return res.status(403).json({ message: 'Your verification link may have expired. Please click on resend for verify your Email.' });
        }
      });

        
  
        const user = await User.findById(req.params.id);
        if (!user) {
  
          return res.status(401).send({
            msg: "We were unable to find a user for this verification. Please SignUp!",
          });
  

        } else if (user.isVerified) {
          return res
            .status(200)
            .send("User has been already verified. Please Login");
  

        } else {
          const updated = await User.updateOne(
            {isVerified: true}
          );
  

          if (!updated) {
            return res.status(500).send({ msg: err.message });

          } else {
            return res
              .status(200)
              .send("Your account has been successfully verified");
          }
        }
    } catch (error) {
      console.log(error);
    }
  }
);

module.exports = router;