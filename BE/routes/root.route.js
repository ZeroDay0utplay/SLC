const {router, authorization} = require("../middleware/exports");

router.get('/', (req, res) => {
    res.status(200);
});

module.exports = router;