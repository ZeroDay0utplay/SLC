const {router, authorization} = require("../middleware/exports");
const fs = require("fs");
const path = require('path');

router.post("/learn", authorization, (req, res)=>{
    const {symbol, topic} = req.body;
    const filePath = path.join(__dirname, `../src/${topic}/${symbol}.mp3`);

    fs.readFile(filePath, (err, data) => {
        if (err) {
            res.status(500).send('Could not read the file.');
        } else {
            res.set('Content-Type', 'application/octet-stream');
            res.set(`Content-Disposition', 'attachment; filename=${symbol}.mp3`);
            data = JSON.stringify(data.toString("base64"));
            res.status(200).json({data: data});
        }
    });
})



module.exports = router;