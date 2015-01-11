{% for article in site.latest_articles limit:1 %}
    <div id="content-sidebar">
     <h2>{{"latest_news"|lc}}</h2>
     <ul>
     {% for article in site.latest_5_articles %}
       <li><a href="{{ article.url }}">{{ article.title }}</a> ({{ article.created_at | format_date:"%d.%m" }})</li>
     {% endfor %}
     </ul>
    </div>
       {% endfor %}
