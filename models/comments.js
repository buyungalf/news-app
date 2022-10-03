module.exports = (sequelize, Sequelize) => {
  const Comments = sequelize.define("comments", {
    parent_id: {
      type: Sequelize.INTEGER,
    },
    news_id: {
      type: Sequelize.INTEGER,
    },
    comment: {
      type: Sequelize.STRING,
    },
  });

  return Comments;
};
