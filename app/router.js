'use strict';

module.exports = app => {
  app.redirect('/', '/douban/index');

  app.get('/douban/index', app.controller.douban.index.index);
  app.get('/douban/more/:category', app.controller.douban.index.getMore);
  app.get('/douban/searchMovie', app.controller.douban.index.searchMovie);
  app.get('/douban/movieDetail/:movieid', app.controller.douban.index.movieDetail);

  app.get('/user/index/:id', app.controller.user.user.index);
  app.post('/user/update/:id', app.controller.user.user.update);
  app.get('/user/add/', app.controller.user.user.add);
  app.get('/user/delete/:id', app.controller.user.user.delete);
  app.post('/user/addAction', app.controller.user.user.addAction);
  app.get('/user/userList', app.controller.user.user.userList);

  app.get('/login/login', app.controller.login.login);
  app.post('/login/loginAction', app.controller.login.loginAction);
  app.get('/login/logout', app.controller.login.logout);
};
