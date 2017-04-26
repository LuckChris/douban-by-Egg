{% extends "../layout/layout_douban.tpl" %}
{% block content %}
<div class="container">
  <div class="row">
    <div>
      <img class="col-lg-3 col-md-4 col-sm-5 col-xs-6" src="{{data.image}}" alt="image">
    </div>
    <div class="col-lg-9 col-md-8 col-sm-7 col-xs-6">
      <ul class="list-group li-no-border">
        <li class="list-group-item">
          <strong>豆瓣评分：</strong>
          <span class="average">{{data.average}}</span>
        </li>
        <li class="list-group-item">
          <strong>电影名字：</strong>
          <span>{{data.title}}</span>
        </li>
        <li class="list-group-item">
          <strong>别名：</strong>
          <span>{{data.aka}}</span>
        </li>
        <li class="list-group-item">
          <strong>导演：</strong>
          <span>{{data.directors}}</span>
        </li>
        <li class="list-group-item">
          <strong>国家：</strong>
          <span>{{data.countries}}</span>
        </li>
        <li class="list-group-item">
          <strong>类型：</strong>
          <span>{{data.genres}}</span>
        </li>
        <li class="list-group-item">
          <strong>上映年份：</strong>
          <span>{{data.year}}</span>
        </li>
      </ul>
    </div>
  </div>
  <hr>
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong style="font-size: 20px;">简介</strong>
        </div>
        <div class="panel-body">{{data.summary}}</div>
      </div>
    </div>
  </div>
  <hr>
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong style="font-size: 20px;">评论区</strong>
        </div>
        <div class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div id="comments" class="row">
            <form id="commentForm" action="/comments/add" method="post">
              <div class="form-group">
                {% if(userInfo) %}
                  <input type="hidden" name="comment[from]" value="{{userInfo.id}}">
                {% endif %}
                  <input type="hidden" name="comment[movieId]" value="{{movieId}}">
                  <input id="toId" type="hidden" name="comment[to]">
                  <input id="commentId" type="hidden" name="comment[commentId]">
              </div>
              <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <textarea class="col-lg-12 col-md-12 col-sm-12 col-xs-12" name="comment[content]" rows="4"></textarea>
              </div>
              <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right">
                {% if(userInfo) %}
                  <button id="submit" class="btn btn-primary" type="submit">提交</button>
                {% else %}
                  <button id="submit" type="submit" class="btn btn-primary" data-toggle="modal" data-target="#signinModal">登录后评论</a>
                {% endif %}
              </div>
            </form>
          </div>
          <ul class="row media-list">
            {% if(comments and comments.length>0) %}
              {% for item in comments %}
                <li class="media">
                  <div class="pull-left">
                    <a class="comment" href="#comments" data-cid="{{item.id}}" data-tid="{{item.fromId}}">
                      <img class="media-object" style="width: 64px; height: 64px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIi8+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+">
                    </a>
                  </div>
                  <div class="media-body">
                    <h4 class="comment media-heading" data-cid="{{item.id}}" data-tid="{{item.fromId}}">
                      <a href="#comments" class="style-none">{{item.fromName}}</a>
                      <small class="pull-right text-muted">{{item.create_time | formatTime}}</small>
                    </h4>
                    <pre>{{item.content}}</pre>
                    {% if(item.replies) %}
                      {% for reply in item.replies %}
                        <div class="media">
                          <div class="pull-left">
                            <a class="comment" href="#comments" data-cid="{{reply.commentId}}" data-tid="{{reply.fromId}}">
                              <img class="media-object" style="width: 64px; height: 64px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIi8+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+">
                            </a>
                          </div>
                          <div class="media-body">
                            <h4 class="media-heading">
                              <a class="comment style-none" href="#comments" data-cid="{{reply.commentId}}" data-tid="{{reply.fromId}}">{{reply.fromName}}</a>
                              <small class="text-info">&nbsp;回复&nbsp;</small>
                              <a class="comment style-none" href="#comments" data-cid="{{reply.commentId}}" data-tid="{{reply.toId}}">{{reply.toName}}</a>
                              <small class="pull-right text-muted">{{item.create_time | formatTime}}</small>
                            </h4>
                            <p>{{reply.reply_content}}</p>
                          </div>
                        </div>
                      {% endfor %}
                    {% endif %}
                  </div>
                </li>
                <hr>
              {% endfor %}
            {% endif %}
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
{% endblock %}