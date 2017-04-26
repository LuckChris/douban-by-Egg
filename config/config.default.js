'use strict';

const fs = require('fs');
const path = require('path');

module.exports = appInfo => {
  const config = {};

  // should change to your own
  config.keys = appInfo.name + '123456';

  config.siteFile = {
    '/favicon.ico': fs.readFileSync(path.join(appInfo.baseDir, 'app/public/favicon.png')),
  };

  config.staticServer = {
    staticPath: path.join(appInfo.baseDir, 'app'),
    imagePath: '/public/images'
  }
  config.douban = {
    doubanBaseUrl: 'http://api.douban.com/v2/movie',
    inTheaters: 'in_theaters',
    comingSoon: 'coming_soon',
    top250: 'top250',
    subject: 'subject'
  }

  config.mysql = {
    client: {
      host:'localhost',
      port: '3306',
      user: 'root',
      password: 'root',
      database: 'douban_egg'
    },
    app: true,
    agent: false
  };

  config.middleware = [
    'checklogin'
  ]
  
  config.checklogin = {
    ignore(ctx) {
      let ignoreUrl = [
        '/login/login',
        '/login/loginAction',
        '/login/logout',
        '/user/add',
        '/user/addAction'
      ]
      let url = ctx.request.url
      return ignoreUrl.some((item)=>{
        return url === item;
      })
    }
  }
  return config;
};
