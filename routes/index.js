var express = require("express");
var router = express.Router();

const db = require("../models");
const Op = db.Sequelize.Op;

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("coba", { title: "Express" });
});

module.exports = router;
