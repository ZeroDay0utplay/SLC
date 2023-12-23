const {router, authorization} = require("../middleware/exports");
const fs = require("fs");
const path = require('path');

const topics = {
    "letters": ['A', 'B', 'C', 'D', 'E'],//, 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'],
    "numbers": ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    "colors": ['Red', 'Green', 'Blue', 'Yellow', 'Orange', 'Purple', 'Brown', 'Gray', 'Black', 'White']
}


router.post("/test", (req, res)=>{
    const topic = req.body.topic;
    console.log(req.body);
    if(!topics[topic]) {
        return res.status(400).send('Invalid topic');
    }

    const arr = topics[topic];
    const randIndex1 = Math.floor(Math.random() * arr.length);
    const randIndex2 = Math.floor(Math.random() * arr.length);
    const answer = randIndex1 === randIndex2;

    const sym = arr[randIndex1];
    const audioFile = path.join(__dirname, `../src/${topic}/${arr[randIndex2]}.mp3`);

    fs.readFile(audioFile, (err, data) => {
        if (err) {
            res.status(500).send('Could not read the file.');
        } else {
            res.set('Content-Type', 'application/octet-stream');
            res.set(`Content-Disposition', 'attachment; filename=${arr[randIndex2]}.mp3`);
            data = JSON.stringify(data.toString("base64")); // serialization
            res.status(200).json({"symbol": sym, "data": data, "answer": answer});
        }
    });
})


module.exports = router;