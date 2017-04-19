'use strict';

module.exports = app => {
  class Douban extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.config = this.ctx.app.config.douban;
      this.doubanBaseUrl = this.config.doubanBaseUrl;
      this.inTheaters = this.config.inTheaters;
      this.comingSoon = this.config.comingSoon;
      this.top250 = this.config.top250;
    }
    * request(api, opts) {
      const options = Object.assign({
        dataType: 'json',
        timeout: [ '30s', '30s' ],
      }, opts);

      const result = yield this.ctx.curl(`${this.doubanBaseUrl}/${api}`, options);
      return result.data;
    }

    * getMovies(category) {
      let inTheatersMovies = yield this.getCatgeMovies(this.inTheaters);
      let ComingSoonMovies = yield this.getCatgeMovies(this.comingSoon);
      let Top250Movies = yield this.getCatgeMovies(this.top250);
      let movies = [];
      movies.push(inTheatersMovies, ComingSoonMovies, Top250Movies);
      return movies;
    }

    * getCatgeMovies(category, p=1) {
      // 每页展示12条数据
      let count = 12;
      let start = (p-1)*count;
      let url = category + '?' + 'start=' + start + '&count=' + count;
      let cateMovies = yield this.request(url, {
        dataType: 'json',
      });
      cateMovies.categoryUrl = '/douban/more/' + category;
      return cateMovies;
    }

    // 搜索电影
    * searchMovies(q='', p=1) {
      let count = 12;
      let start = (p-1)*count;
      let url = 'search?q=' + q + '&start=' + start + '&count=' + count;
      let result = yield this.request(url, {
        dataType: 'json',
      });
      result.category = '/douban/searchMovie';
      return result;
    }
  }
  return Douban;
}