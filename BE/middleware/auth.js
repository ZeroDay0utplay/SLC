const jwt = require("jsonwebtoken")


function generateAccessToken(userId) {
    const payload = {
        userId: userId,
        iat: Math.floor(Date.now() / 1000),
        exp: Math.floor(Date.now() / 1000) + (60 * 90), // number of minutes
    };

    return jwt.sign(payload, process.env.TOKEN_SECRET);
}


function authorization(req, res, next) {
    // const rawHeaders = req['rawHeaders'];
    // const token = rawHeaders[rawHeaders.length -1].slice(6);
    const token = req.body.auth_token;
    if (token == null) {
        return res.sendStatus(401);
    }

    jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
        if (err) {
            if (err.name === 'TokenExpiredError') {
                return res.status(403).json({ message: 'Access token has expired' });
            } else {
                return res.status(403).json({ message: 'Access token is invalid' });
            }
        }
        req.user = user;
        next();
    });
}

module.exports = {
    generateAccessToken,
    authorization
}
