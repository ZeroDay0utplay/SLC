const {router, authorization, User} = require("../middleware/exports");




router.post("/save_test", authorization, async (req, res) => {
    try {
        const { percentage, topic } = req.body;
        if (!percentage || !topic) return res.status(400).json({ error: "Missing data" });
        const _id = (req.user.userId).toString();
        const test_topic = "test_"+topic;
        const user = await User.findOne({ _id: _id });
        const topicExists = user[test_topic];
        if (topicExists === undefined){
            user[test_topic] = {"nb_tests": 1, "accuracy": percentage};
        }
        else{
            const nb_tests_map = new Map();
            nb_tests_map.set(`${test_topic}.nb_tests`, 1);
            // convert Map to object
            let nb_tests = {}
            for (let [key, value] of nb_tests_map.entries()) {
                nb_tests[key] = value;
            }

            await User.updateOne({ _id: _id }, { $inc: nb_tests });
            const test = user[test_topic];

            const test_acc_map = new Map();
            const acc = (test.get("accuracy") + percentage)/(test.get("nb_tests")+1);
            test_acc_map.set(`${test_topic}.accuracy`, acc);

            let test_acc = {}

            for (let [key, value] of test_acc_map.entries()) {
                test_acc[key] = value;
            }
            await User.updateOne({ _id: _id }, { $set: test_acc});
        }
        await user.save();
        return res.status(200).json({message: "Test saved successfully"});
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Server error" });
    }
});



module.exports = router;