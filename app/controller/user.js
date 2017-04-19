'use strict';

const moment = require('moment');

module.exports = app => {
  class UserController extends app.Controller {
    * index() {
      const ctx = this.ctx;
      const userId = ctx.session.userInfo.id;
      // const userId = this.app.locals.userInfo.id;
      const paramsId = ctx.params.id;
      if(!userId) {
        ctx.redirect('/login/login')
      }
      if(userId != paramsId) {
        this.ctx.redirect('/user/index/' + userId);
      }
      const userInfo = yield ctx.service.userInfo.getUserById(userId);
      
      yield ctx.render('user/index.tpl', { userInfo: userInfo });
    }

    * update() {
      let ctx = this.ctx
      let body = ctx.request.body
      let username = body.username
      let oldpwd = body.oldpwd
      let newpwd = body.newpwd
      let userId = ctx.session.userInfo.id
      // let userId = this.app.locals.userInfo.id

      if(!userId) {
        ctx.redirect('login/login')
        return;
      }

      let userInfo = yield ctx.service.userInfo.getUserById(userId)
      console.log(userInfo,oldpwd);
      if(!userInfo || userInfo.password!=oldpwd) {
        console.log('userInfo wrong!')
        ctx.redirect('/user/index/' + userId);
        return;
      }
      let result = yield ctx.service.userInfo.updateUserById(userId, username, newpwd);
      if(result>0) {
        console.log('更新成功');
      }
      ctx.redirect('/user/index/'+userId);
    }

    * add() {
      yield this.ctx.render('user/add.tpl');
    }

    * addAction() {
      let ctx = this.ctx
      let body = ctx.request.body
      let username = body.username
      let pwd = body.pwd
      let loginTime = moment().format('YYYY-MM-DD HH:mm:ss');

      if(!username || ! pwd) {
        console.log('请将用户信息填写完整');
        ctx.redirect('/user/add/');
        return;
      }
      let user = yield ctx.service.userInfo.getUserByName(username);
      if(user) {
        console.log('用户名已经存在');
        ctx.redirect('/user/add/');
        return;
      }
      let userInfo = {
        userName: username,
        password: pwd,
        createTime: loginTime
      }
      let result = yield ctx.service.userInfo.addUser(userInfo);
      if(result>0) {
        console.log('注册成功');
        ctx.redirect('/login/login');
      } else {
        console.log('注册失败');
        ctx.redirect('/user/add');
      }

    }

    * userList() {
      let ctx = this.ctx;
      let userName = ctx.session.userInfo.userName;
      // let userName = this.app.locals.userInfo.userName;
      if(userName!=='admin') {
        console.log('没有管理员权限');
        ctx.redirect('/');
        return;
      }
      let userList = yield ctx.service.userInfo.getUserList();
      // let userInfo = this.app.locals.userInfo;
      let userInfo = ctx.session.userInfo;
      yield ctx.render('user/userList.tpl', {userList: userList, userInfo: userInfo});
    }

    * delete() {
      let ctx = this.ctx;
      let deleteId = ctx.params.id;
      let currentId = ctx.session.userInfo.id;
      // let currentId = this.app.locals.userInfo.id;
      let userInfo = yield ctx.service.userInfo.getUserById(currentId);
      if(!userInfo || userInfo.userName !== 'admin') {
        console.log('用户不存在或者没有管理员权限')
      }
      let result =  yield ctx.service.userInfo.deleteById(deleteId);
      if(result>1) {
        console.log('删除成功');
        ctx.redirect('/user/userList');
      } else {
        console.log('删除失败');
        ctx.redirect('/user/userList');
      }
    }
  }
  return UserController;
}