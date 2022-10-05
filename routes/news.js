const e = require("express");
var express = require("express");
var router = express.Router();

const db = require("../models");
const auth = require("../auth/index");
const News = db.news;
const Comments = db.comments;
const Op = db.Sequelize.Op;

/* GET home page. */
router.get("/", function (req, res, next) {
  News.findAll()
    .then((data) => {
      res.render("index", {
        title: "News App",
        deleted: false,
        News: data,
        session: req.session,
      });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

/* GET deleted news */
router.get("/deleted", auth, function (req, res, next) {
  News.findAll({ where: { destroyTime: { [Op.not]: null } }, paranoid: false })
    .then((data) => {
      res.render("index", {
        title: "News App",
        deleted: true,
        News: data,
        session: req.session,
      });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// get news detail
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

router.get("/add", auth, function (req, res, next) {
  res.render("news_add", { title: "Add News" });
});

// insert news
router.post("/add", auth, function (req, res, next) {
  if (!req.body.title) {
    req.flash("error", "Please input the title!");
    return res.redirect("add");
  } else if (!req.file) {
    req.flash("error", "Please upload image for thumbnail!");
    return res.redirect("add");
  } else if (!req.body.content) {
    req.flash("error", "Please input the content!");
    return res.redirect("add");
  } else if (!req.body.author) {
    req.flash("error", "Please input the author!");
    return res.redirect("add");
  }

  let news = {
    title: req.body.title,
    content: req.body.content,
    thumbnail: req.file.path,
    author: req.body.author,
  };
  News.create(news)
    .then(() => {
      req.flash("success", "Data inserted successfully!");
      return res.redirect("/news");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// edit news
router.get("/edit/:id", auth, function (req, res, next) {
  let id = req.params.id;
  News.findByPk(id).then((data) => {
    res.render("news_edit", { title: "Edit News", item: data });
  });
});

router.post("/edit", auth, function (req, res, next) {
  let id = req.body.id;
  if (!req.body.title) {
    req.flash("error", "Please input the title!");
    return res.redirect("edit/" + id);
  } else if (!req.body.content) {
    req.flash("error", "Please input the content!");
    return res.redirect("edit/" + id);
  } else if (!req.body.author) {
    req.flash("error", "Please input the author!");
    return res.redirect("edit/" + id);
  }
  let news = {};
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
    .then(() => {
      req.flash("success", "Data updated successfully!");
      return res.redirect("/news");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// delete news
router.get("/delete/:id", auth, function (req, res, next) {
  let id = parseInt(req.params.id);
  News.destroy({
    where: { id: id },
  })
    .then(() => {
      req.flash("success", "Delete success!");
      return res.redirect("/news");
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

// restore deleted news
router.get("/restore/:id", auth, function (req, res, next) {
  let id = parseInt(req.params.id);
  News.restore({
    where: { id: id },
  })
    .then(() => {
      req.flash("success", "Restore success!");
      res.redirect("/news/deleted");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

// force delete news
router.get("/force_delete/:id", auth, function (req, res, next) {
  let id = parseInt(req.params.id);
  News.destroy({
    where: { id: id },
    force: true,
  })
    .then(() => {
      req.flash("success", "Delete success!");
      res.redirect("/news/deleted");
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

module.exports = router;
