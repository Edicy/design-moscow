<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="et">
<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>
<body>
<div id="container">
	<div id="lang-and-search">
  <div id="lang-and-search-BG">
  {% include "Langmenu" %}
{% include "Search" %}
  </div>
	</div>
	<div id="blog">
  <div id="sidebar">	
   {% include "Menus" %}
   <div id="footer" class="clearfix">
    {% content name="footer" xpage="true" %}
   </div>
  </div>	
  <div id="content">
   <div id="content-head">
   <h1 class="clearfix">{% editable site.header %}</h1>
   <h2 class="clearfix">{% content name="slogan" xpage="true" %}</h2>
   </div>
   <div id="content-blog">
    {% addbutton class="add-article" %}
    {% for article in articles %}
     <h2><a href="{{ article.url }}" class="none">{{ article.title }}</a></h2>
     <span class="small">{{ article.created_at | format_date:"long" }}, <strong>{{ article.author.name }}</strong>, <a href="{{ article.url }}#comments">{{"comments_for_count"|lc}}: {{ article.comments_count }}</a></span>
     <br /><br />
     <p class="clearfix">{{ article.excerpt }} <a href="{{ article.url }}">{{"read_more"|lc}}</a></p>
     <br /><br />
    {% endfor %}   
   </div>
  </div>
  <div class="clearer"></div>
	</div>
</div>
<div id="edicy" class="small">
{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
{% unless editmode %}{{ site.analytics }}{% endunless %} 
  {% include "JS" %}
</body>
</html>