module.exports = options => {
  return function* checklogin(next) {
    let userInfo = this.session.userInfo;
    // let userInfo = this.app.locals.userInfo;
    if(!userInfo) {
      console.log('no login');
      return this.redirect('/login/login');
    }
    yield next;
  }
}