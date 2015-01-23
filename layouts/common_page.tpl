<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
{% include "SiteHeader" %}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>
<body>
<div id="container" class="content-hyphenate">
	<div id="lang-and-search">
  <div id="lang-and-search-BG">
  {% include "Langmenu" %}
{% include "Search" %}
  </div>
	</div>
	<div id="body">
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
   <div>
    <img src="{{ images_path }}/illustration.jpg" alt="" title="" />
   </div>
   <div>
    <div id="content-body">
      <div id="content-body-inner" class="clearfix">
     {% content %}
      </div>
    </div>
     {% include "News" %}
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