{% extends "../layout/layout.tpl" %}

{% block content %}
<form action="/user/addAction" method="POST">
  <fieldset>
    <legend>User signUp</legend>
    <table>
      <tr>
        <td><label for="txtname">用户名：</label></td>
        <td><input type="text" id="txtname" name="username" value="{{userInfo.userName}}" /></td>
      </tr>
      <tr>
        <td><label for="txtpswd">密码：</label></td>
        <td><input type="password" name="pwd" /></td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="submit" value='注册' />
        </td>
      </tr>
    </table>
  </fieldset>
</form>
{% endblock %}