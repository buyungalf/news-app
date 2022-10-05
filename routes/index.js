var express = require("express");
var router = express.Router();
var bcrypt = require("bcryptjs");

const db = require("../models");
const User = db.users;
const Op = db.Sequelize.Op;

router.get("/", function (req, res, next) {
  res.redirect("/login");
});

// register form
router.get("/register", function (req, res, next) {
  res.render("register", { title: "Express" });
});

//register post
router.post("/register", function (req, res, next) {
  var password_hash = bcrypt.hashSync(req.body.password, 8);
  var user = {
    nama: req.body.nama,
    email: req.body.email,
    username: req.body.username,
    password: password_hash,
  };
  User.create(user)
    .then(() => {
      res.redirect("/login");
    })
    .catch((err) => {
      res.redirect("/register", {
        info: "Error",
        message: err.message,
      });
    });
});

// login
router.get("/login", function (req, res, next) {
  res.render("login", { title: "Express" });
});

router.post("/login", function (req, res, next) {
  //   var password_hash = bcrypt.compareSync(req.body.password, hash);
  User.findOne({
    where: { username: req.body.username },
  })
    .then((data) => {
      if (data) {
        var valid = bcrypt.compareSync(req.body.password, data.password);
        if (valid) {
          req.session.username = req.body.username;
          req.session.islogin = true;

          res.redirect("/news");
        } else {
          res.redirect("/login");
        }
      } else {
        res.redirect("/login");
      }
    })
    .catch((err) => {
      res.json({
        info: "Login Error",
        message: err.message,
      });
    });
});

// logout
router.get("/logout", function (req, res, next) {
  req.session.destroy();
  res.redirect("/news");
});

module.exports = router;
