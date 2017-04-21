{% extends "../layout/layout_douban.tpl" %}
{% block title %}UserInfo{% endblock %}
{% block content %}
<div class="container">
  <div class="row">
    <form  class="form-horizontal" action="/user/update/{{info.id}}" method="POST">
      <div class="form-group">
        <label for="username" class="col-lg-2 col-md-2 col-sm-2 col-xs-3 control-label">用户名：</label>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-8">
          <input type="text" class="form-control" id="username" name="username" value="{{info.userName}}">
        </div>
      </div>
      <div class="form-group">
        <label for="oldpwd" class="col-lg-2 col-md-2 col-sm-2 col-xs-3 control-label control-label">旧密码：</label>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-8">
          <input type="password" class="form-control" id="oldpwd" name="oldpwd">
        </div>
      </div>
      <div class="form-group">
        <label for="newpwd" class="col-lg-2 col-md-2 col-sm-2 col-xs-3 control-label control-label">新密码：</label>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-8">
          <input type="password" class="form-control" id="newpwd" name="newpwd">
        </div>
      </div>
      <div class="form-group">
        <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-3 col-lg-5 col-md-5 col-sm-5 col-xs-8 control-label">
          <button type="submit" class="btn btn-primary pull-left">修改</button>
          {% if(info.userName == 'admin') %}
          <a class='btn btn-primary pull-left manager-user' href="/user/userList">管理用户</a>
          {% endif %}
        </div>
      </div>
    </form>
  </div>
</div>
{% endblock %}