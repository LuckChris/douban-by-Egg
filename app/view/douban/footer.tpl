<nav aria-label="Page navigation" class="text-center">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    {% if(search==true) %}
      {% for i in range(0, totalCount) %}
        {% if(currentPage == i+1) %}
          <li class="active">
            <a href="{{category}}?q={{q}}&p={{i+1}}">{{i+1}}</a>
          </li>
        {% else %}
          <li>
            <a href="{{category}}?q={{q}}&p={{i+1}}">{{i+1}}</a>
          </li>
        {% endif %}
      {% endfor %}
    {% else %}
      {% for i in range(0, totalCount) %}
        {% if(currentPage == i+1) %}
          <li class="active">
            <a href="{{category}}?p={{i+1}}">{{i+1}}</a>
          </li>
        {% else %}
          <li>
            <a href="{{category}}?p={{i+1}}">{{i+1}}</a>
          </li>
        {% endif %}
      {% endfor %}
    {% endif %}
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>