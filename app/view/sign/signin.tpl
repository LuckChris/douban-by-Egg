{% extends "../layout/layout_douban.tpl" %}
{% block title %}Signin{% endblock %}
{% block content %}
<div class="container">
  <form class="form-horizontal" action="/login/loginAction" method='POST'>
    <div class="form-group">
      <label for="username" class="col-sm-4 control-label">用户名</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="username" name="username" placeholder="UserName">
      </div>
    </div>
    <div class="form-group">
      <label for="pwd" class="col-sm-4 control-label">密码</label>
      <div class="col-sm-4">
        <input type="password" class="form-control" name='password' id="pwd" placeholder="Password">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-4">
        <button type="submit" class="btn btn-primary">登录</button>
      </div>
    </div>
  </form>
</div>
{% endblock %}