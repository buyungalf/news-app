const e = require("express");
var express = require("express");
var router = express.Router();

const db = require("../models");
const auth = require("../auth/index");
const News = db.news;
const Comments = db.comments;
const Op = db.Sequelize.Op;

/* GET home page. */
router.get("/", auth, function (req, res, next) {
  News.findAll()
    .then((data) => {
      res.render("index", { title: "News App", News: data });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// get detail
router.get("/detail", function (req, res, next) {
  var id = parseInt(req.query.id);
  News.findByPk(id)
    .then((data) => {
      Comments.findAll({ where: { news_id: id } })
        .then((data2) => {
          res.render("news_detail", {
            title: "News App",
            item: data,
            comments: data2,
          });
        })
        .catch((err) => {
          res.json({
            info: "Error1",
            message: err.message,
          });
        });
    })
    .catch((err) => {
      res.json({
        info: "Error2",
        message: err.message,
      });
    });
});

router.get("/add", function (req, res, next) {
  res.render("news_add", { title: "Add News" });
});

// insert news
router.post("/add", function (req, res, next) {
  if (!req.file) {
    const err = new Error("image not found");
    throw err;
  }

  let news = {
    title: req.body.title,
    content: req.body.content,
    thumbnail: req.file.path,
    author: req.body.author,
  };
  News.create(news)
    .then((data) => {
      res.redirect("/news");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// edit news
router.get("/edit/:id", function (req, res, next) {
  let id = req.params.id;
  News.findByPk(id).then((data) => {
    res.render("news_edit", { title: "Edit News", item: data });
  });
});

router.post("/edit", function (req, res, next) {
  let news = {};
  let id = req.body.id;
  if (!req.file) {
    news = {
      title: req.body.title,
      content: req.body.content,
      author: req.body.author,
    };
  } else {
    news = {
      title: req.body.title,
      content: req.body.content,
      thumbnail: req.file.path,
      author: req.body.author,
    };
  }

  News.update(news, {
    where: { id: id },
  })
    .then((data) => {
      res.redirect("/news");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// delete news
router.get("/delete/:id", function (req, res, next) {
  let id = parseInt(req.params.id);
  News.destroy({
    where: { id: id },
  })
    .then((data) => {
      res.redirect("/news");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

//insert comment
router.post("/add_comment", function (req, res, next) {
  let id = req.body.news_id;
  let comment = {
    name: req.body.name,
    news_id: id,
    comment: req.body.comment,
  };
  Comments.create(comment)
    .then(() => {
      res.redirect("/news/detail?id=" + id);
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

module.exports = router;
