{% extends "../layout/layout_douban.tpl" %}
{% block content %}
<div class="wrapper">
  <div class="container">
    <div class="row">
      {% for movie in movies %}
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3>
              <a href="{{movie.categoryUrl}}">{{movie.title}}</a>
            </h3>
          </div>
          <div class="panel-body">
            {% for subject in movie.subjects.slice(0,12) %}
              <div class="col-md-2">
                <div class="thumbnail">
                  <a href="/movie/{{subject.id}}">
                    <img src="{{subject.images.medium}}" alt="{{subject.title}}">
                  </a>
                  <div class="caption">
                    <h4>{{subject.title}}</h4>
                    <p>
                      <a href="/movie/{{subject.id}}" class="btn btn-primary">观看预告片</a>
                    </p>
                  </div>
                </div>
              </div>
            {% endfor %}
          </div>
        </div>
      {% endfor %}
    </div>
  </div>
</div>
{% endblock %}