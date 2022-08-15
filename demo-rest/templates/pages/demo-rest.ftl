<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <title>${content.windowTitle!content.title!}</title>
    <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/demo-rest/webresources/demo-style.css" media="all" />
  </head>
  <body>

    <div class="container">
      <h1>${content.windowTitle!content.title!}</h1>
    
    <div class="main">
	    [@cms.area name="main"/]
      </div>

      <div class="footer">
	[@cms.area name="footer"/]
      </div>
    </div>	

  </body>
</html>