const jwt = require("jsonwebtoken")


function generateAccessToken(userId) {
    const payload = {
        userId: userId,
        expiresIn: '90m'
    };

    return jwt.sign(payload, process.env.TOKEN_SECRET);
}


function authorization(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (token == null) {
        return res.sendStatus(401);
    }

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) {
            return res.sendStatus(403);
        }

        req.user = user;
        next()
    });
}

module.exports = {
    generateAccessToken,
    authorization
}
