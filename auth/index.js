const auth = function (req, res, next) {
  if (req.session && req.session.islogin) {
    return next();
  } else {
    return res.sendStatus(401);
  }
};

module.exports = auth;
