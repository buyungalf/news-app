module.exports = (sequelize, Sequelize) => {
  const Comments = sequelize.define("comments", {
    news_id: {
      type: Sequelize.INTEGER,
    },
    name: {
      type: Sequelize.STRING,
    },
    comment: {
      type: Sequelize.STRING,
    },
  });

  return Comments;
};
