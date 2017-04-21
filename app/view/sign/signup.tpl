{% extends "../layout/layout_douban.tpl" %}
{% block title %}SignUp{% endblock %}
{% block content %}
<div class="container">
  <form class="form-horizontal" action="/user/addAction" method='POST'>
    <div class="form-group">
      <label for="username" class="col-sm-2 control-label">用户名</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="username" name="username" placeholder="UserName">
      </div>
    </div>
    <div class="form-group">
      <label for="pwd" class="col-sm-2 control-label">密码</label>
      <div class="col-sm-2">
        <input type="password" class="form-control" name='pwd' id="pwd" placeholder="Password">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-4">
        <button type="submit" class="btn btn-primary">注册</button>
      </div>
    </div>
  </form>
</div>
{% endblock %}