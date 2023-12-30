const {router, User, bcrypt} = require("../middleware/exports");



router.post("/resetPwd", async (req, res)=>{
    try{
        const user = await User.findOne({email: req.body.email});
        if (!user) return res.status(400).json({ message: "User does not exist" });
        if (user.reqPwdChange){
            const hashedPassword = bcrypt.hashSync(req.body.password, 10);
            user["password"] = hashedPassword;
            user["reqPwdChange"] = false;
            await user.save();
            return res.status(200).json({message: "Password has been changed successfully"});
        }
        else{
            return res.status(407).json({message: "Please click on the link that has been sent to your mail"})
        }  
        

    }catch(err){
        return res.status(500).json({message: "Internal Server Error"});
    }
})

module.exports = router;