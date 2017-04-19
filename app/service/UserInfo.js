'use strict';

const moment = require('moment');

module.exports = app => {
  class UserInfo extends app.Service {
    constructor(ctx) {
      super(ctx);
    }

    * getUserById(userId) {
      const userInfo = yield this.app.mysql.get('users', { id: userId });
      return userInfo;
    }
    * getUserByName(userName) {
      const userInfo = yield this.app.mysql.get('users', { userName: userName });
      return userInfo;
    }

    * updateUserById(userId, userName, password) {
      const userInfo = {
        id: parseInt(userId),
        userName: userName,
        password: password
      }
      const result = yield this.app.mysql.update('users', userInfo);
      return result.affectedRows;
    }

    * addUser(userInfo) {
      const result = yield this.app.mysql.insert('users', userInfo);
      return result.affectedRows;
    }

    * updateLastedLoginTime(userId) {
      let loginTime = moment().format('YYYY-MM-DD HH:mm:ss');
      const userInfo = {
        id: parseInt(userId),
        lastedLoginTime: loginTime
      }
      const result = yield this.app.mysql.update('users', userInfo);
      return result.affectedRows;
    }

    * getUserList() {
      const result = yield this.app.mysql.select('users');
      return result;
    }

    * deleteById(deleteId) {
      const result = yield this.app.mysql.delete('users', {
        id: deleteId
      });
      return result.affectedRows;
    }
    
  }

  return UserInfo;
};
