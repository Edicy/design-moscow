<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="et">
<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
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
   <div id="content-blog" class="clearfix">
    <h2>{% editable article.title plain="true" %}</h2>
    <span class="small">{{ article.created_at | format_date:"long" }}, <strong>{{ article.author.name }}</strong>, <a href="#comments">{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a></span>
    <br /><br />
    {% editable article.excerpt %}
    <br /><br />
    {% editable article.body %}
    <br /><br />   
    <div class="hr"></div>

    <div id="comments">
     <h2>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>
     {% for comment in article.comments %}
     <div class="edy-site-blog-comment">
     <div class="L">
      <strong>{{ comment.author }}</strong><br />{{ comment.created_at | format_date:"long" }}
     </div>
     <div class="R">
      <p>
       {{ comment.body }} {% removebutton %}
      </p>
     </div>
     <div class="clearer"></div>
     <div class="hr"></div>
      </div>  
     {% endfor %}
     <br />
     <h2>{{"add_a_comment"|lc}}</h2>
     {% commentform %}
      {% unless comment.valid? %}<div><ul>
      {% for error in comment.errors %}
      <li>{{ error | lc }}</li>
      {% endfor %}
      </ul></div>{% endunless %}
      <div class="formtitle left"><strong>{{"name"|lc}}</strong></div>
      <div class="right"><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></div>
      <div class="clearer"></div>	
      <div class="formtitle left"><strong>{{"email"|lc}}</strong></div>
      <div class="right"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></div>
      <div class="clearer"></div>  
      <div class="formtitle left"><strong>{{"comment"|lc}}</strong></div>
      <div class="right"><textarea rows="6" cols="50" name="comment[body]">{{comment.body }}</textarea></div>
      <div class="clearer"></div>
      <div class="add right"><input type="submit" class="submit" value="" /></div>
      <div class="clearer"></div>
     {% endcommentform %}
    </div>
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