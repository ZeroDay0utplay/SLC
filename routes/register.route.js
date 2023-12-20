


router.post("/register", async (req, res)=>{
    const {email, password, name, age} = req.body;
    const userExists = await User.findOne({ email: email });
    if (userExists) {
        return res.status(400).json({ errors: [{ msg: 'User already exists' }] });
    }
    // Create new user
    //const hashedPassword = await bcrypt.hash(password, 10);

    const user = new User({
        email,
        password: password,
        name,
        age
    });
    await User.save();
});