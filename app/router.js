'use strict';

module.exports = app => {
  app.redirect('/', '/news');
  app.get('/news', app.controller.news.list);
  app.get('/news/item/:id', app.controller.news.detail);
  app.get('/news/user/:id', app.controller.news.user);

  app.get('/douban/index', app.controller.douban.index.index);
  app.get('/douban/more/:category', app.controller.douban.index.getMore);
  app.get('/douban/searchMovie', app.controller.douban.index.searchMovie);

  app.get('/user/index/:id', app.controller.user.index);
  app.post('/user/update/:id', app.controller.user.update);
  app.get('/user/add/', app.controller.user.add);
  app.get('/user/delete/:id', app.controller.user.delete);
  app.post('/user/addAction/', app.controller.user.addAction);
  app.get('/user/userList/', app.controller.user.userList);

  app.get('/login/login', app.controller.login.login);
  app.post('/login/loginAction', app.controller.login.loginAction);
  app.get('/login/logout', app.controller.login.logout);
};
