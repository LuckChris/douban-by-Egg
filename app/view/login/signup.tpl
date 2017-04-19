{% extends "../layout/layout_douban.tpl" %}
{% block title %}SignUp{% endblock %}
{% block content %}
<form class="form-horizontal" action="/user/add" method='POST'>
  <div class="form-group">
    <label for="username" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="username" name="username" placeholder="UserName">
    </div>
  </div>
  <div class="form-group">
    <label for="pwd" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-2">
      <input type="password" class="form-control" name='password' id="pwd" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-4">
      <button type="submit" class="btn btn-primary">登录</button>
    </div>
  </div>
</form>
{% endblock %}