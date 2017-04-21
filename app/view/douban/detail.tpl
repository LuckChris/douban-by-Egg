{% extends "../layout/layout_douban.tpl" %}
{% block content %}
<div class="container">
  <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
      <div style="border:1px solid #000;">
        <embed style="width: 60%; height: 100%;" src="{{movie.flash}}" allowFullScreen="true" quality="high" width="720" height="600" align="middle" allowScriptAcess="always" type="application/x-shockwave-flash">
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
      <ul class="list-group li-no-border">
        <li class="list-group-item">
          <strong>电影名字：</strong>
          <span>{{movie.title}}</span>
        </li>
        <li class="list-group-item">
          <strong>导演：</strong>
          <span>{{movie.doctor}}</span>
        </li>
        <li class="list-group-item">
          <strong>国家：</strong>
          <span>{{movie.country}}</span>
        </li>
        <li class="list-group-item">
          <strong>语言：</strong>
          <span>{{movie.language}}</span>
        </li>
        <li class="list-group-item">
          <strong>上映年份：</strong>
          <span>{{movie.year}}</span>
        </li>
      </ul>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong style="font-size: 20px;">简介</strong>
        </div>
        <div class="panel-body">{{movie.summary}}</div>
      </div>
    </div>
  </div>
  <hr>
  <div class="row">
    <div class="panel panel-default col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel-heading">
        <h3>评论区</h3>
      </div>
      <div class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <ul class="media-list">
          {% if(comments and comments.length>0) %}
            {% for item in comments %}
              <li class="media">
                <div class="pull-left">
                  <a class="comment" href="#comments" data-cid="{{item.id}}" data-tid="{{item.from.id}}">
                    <img class="media-object" style="width: 64px; height: 64px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIi8+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading">{{item.from.name}}</h4>
                  <p>{{item.content}}</p>
                  {% if(item.reply and item.reply.length>0) %}
                    {% for reply in item.reply %}
                      <div class="media">
                        <div class="pull-left">
                          <a class="comment" href="#comments" data-cid="{{item.id}}" data-tid="{{reply.from.id}}">
                            <img class="media-object" style="width: 64px; height: 64px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIi8+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading">
                            {{reply.from.name}}
                            <span class="text-info">&nbsp;回复$nbsp;</span>
                            {{reply.to.name}}
                          </h4>
                          <p>{{reply.content}}</p>
                        </div>
                        <hr>
                      </div>
                    {% endfor %}
                  {% endif %}
                </div>
              </li>
            {% endfor %}
          {% endif %}
        </ul>
        <div id="comments">
          <form id="commentForm" action="/comment/add" method="post">
            <div class="input-group input-group-lg">
              <input type="hidden" name="comment[movie]" value="{{movie.id}}">
              {% if(userInfo) %}
                <input type="hidden" name="comment[from]" value="{{userInfo.id}}">
                <input type="hidden" name="comment[tid]">
                <input type="hidden" name="comment[cid]">
              {% endif %}
            </div>
            <div class="input-group input-group-lg col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <textarea class="col-lg-6 col-md-6 col-sm-12 col-xs-12" name="comment[content]" rows="3"></textarea>
            </div>
            <div class="input-group">
              {% if(userInfo) %}
                <button id="submit" class="btn btn-primary" type="submit">提交</button>
              {% else %}
                <button class="btn btn-primary" data-toggle="modal" data-target="#signinModal">登录后评论</a>
              {% endif %}
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
{% endblock %}