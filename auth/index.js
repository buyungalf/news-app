const auth = function (req, res, next) {
  if (req.session && req.session.islogin) {
    return next();
  } else {
    req.flash("error", "You should logged in to access the module!");
    return res.redirect("/login");
  }
};

module.exports = auth;
