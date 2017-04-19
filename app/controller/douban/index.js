'use strict';

const moment = require('moment');

module.exports = app => {
  class IndexController extends app.Controller {
    * index() {
      let ctx = this.ctx;
      
      let movies = yield ctx.service.douban.getMovies() || [];
      let userInfo = this.ctx.session.userInfo;
      // let userInfo = this.app.locals.userInfo;
      console.log('userInfo:',userInfo);
      yield ctx.render('douban/index.tpl', { movies: movies, userInfo: userInfo });
    }
    * getMore() {
      let ctx = this.ctx;
      let url = ctx.request.url;
      let arr = url.match(/\/douban\/more\/\w+\?p=(\d+)/);
      let p = 1;
      if(arr !== null) {
        p = arr[1];
      }
      let category = ctx.params.category;
      
      let movies = yield ctx.service.douban.getCatgeMovies(category, p) || [];
      console.log(movies);
      let totalCount = Math.ceil(movies.total/12);
      yield ctx.render('douban/morelist.tpl', {
        userInfo: ctx.session.userInfo,
        search: false,
        currentPage: p,
        category: category,
        movies: movies,
        showFooter:true,
        totalCount: totalCount
      });
    }
    * searchMovie() {
      let ctx = this.ctx;
      let url = ctx.request.url;
      let q = '', p=1;
      let arr1 = url.match(/\/douban\/searchMovie\?q\=(.*)/);
      if(arr1 !== null) {
        let arr2 = arr1[1].match(/(.+)&p=(\d+)/);
        if(arr2 !== null) {
          q = arr2[1]
          p = arr2[2];
        } else {
          q = arr1[1];
        }
      }
      let movies = yield ctx.service.douban.searchMovies(q, p) || [];
      let category = movies.category;
      let totalCount = Math.ceil(movies.total/12);
      yield ctx.render('douban/morelist.tpl', {
        q: q,
        currentPage: p,
        userInfo: ctx.session.userInfo,
        category: category,
        movies: movies,
        showFooter:true,
        totalCount: totalCount,
        search: true
      });
    }
  }
  return IndexController;
}