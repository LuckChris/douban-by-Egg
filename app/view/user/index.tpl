{% extends "../layout/layout_douban.tpl" %}
{% block title %}UserInfo{% endblock %}
{% block content %}
<form  class="form-horizontal" action="/user/update/{{userInfo.id}}" method="POST">
  <div class="form-group">
    <label for="username" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="username" name="username" value="{{userInfo.userName}}">
    </div>
  </div>
  <div class="form-group">
    <label for="oldpwd" class="col-sm-2 control-label">旧密码：</label>
    <div class="col-sm-2">
      <input type="password" class="form-control" id="oldpwd" name="oldpwd">
    </div>
  </div>
  <div class="form-group">
    <label for="newpwd" class="col-sm-2 control-label">新密码：</label>
    <div class="col-sm-2">
      <input type="password" class="form-control" id="newpwd" name="newpwd">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-4">
      <button type="submit" class="btn btn-primary">修改</button>
      {% if(userInfo.userName == 'admin') %}
      <a class='btn btn-primary' href="/user/userList">管理用户</a>
      {% endif %}
    </div>
  </div>
</form>
{% endblock %}