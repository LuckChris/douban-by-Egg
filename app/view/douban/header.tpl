<div class="container">
  <div class="row">
    <div class="page-header clearfix">
      <a style="text-decoration:none;" href="/douban/index">
        <h1 class="header-h1">Douban</h1>
      </a>
      <a style="text-decoration:none;" href="http://eggjs.org/zh-cn">
        <div class="header-h1 text-right">
          <small>powered by egg.js</small>
        </div>
      </a>
      <div class="col-md-12">
        <form method='get' action='/douban/searchMovie'>
          <div class="input-group col-sm-4 pull-right">
            <input type="text" class="form-control" name='q'>
            <span class="input-group-btn">
              <button class="btn btn-primary" type='submit'>
                搜索
              </button>
            </span>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a href="/" class="navbar-brand">BY豆瓣电影</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      {% if(userInfo) %}
        <li><a href="/user/index/{{userInfo.id}}">{{userInfo.userName}}</a></li>
        <li><span class="vertical-line">|</span></li>
        <li><a href="/login/logout" class="navbar-link">退出</a></li>
      {% else %}
        <li><a id='signin' href="#" class="navbar-link">登录</a></li>
        <li><span class="vertical-line">|</span></li>
        <li><a id='signup' href="#" class="navbar-link">注册</a></li>
      {% endif %}
    </ul>
  </div>
</div>

<div id="signinModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/login/loginAction" method='POST'>
        <h2 class="modal-header">登录</h2>
        <div class="modal-body">
          <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name='username' class="form-control">
          </div>
          <div class="form-group">
            <label for="pwd">密码</label>
            <input type="password" id="pwd" name='password' class="form-control">
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-defaul" type="button" data-dismiss="modal">关闭</button>
          <button class="btn btn-success" type="submit">提交</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div id="signupModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/user/addAction" method='POST'>
        <h2 class="modal-header">注册</h2>
        <div class="modal-body">
          <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" class="form-control">
          </div>
          <div class="form-group">
            <label for="pwd">密码</label>
            <input type="password" id="pwd" name="pwd" class="form-control">
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-defaul" type="button" data-dismiss="modal">关闭</button>
          <button class="btn btn-success" type="submit">提交</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  $('#signin').click(function(){
    $('#signinModal').modal()
  })
  $('#signup').click(function(){
    $('#signupModal').modal()
  })
</script>