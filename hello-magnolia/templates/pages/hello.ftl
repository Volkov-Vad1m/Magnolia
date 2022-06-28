<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <title>${content.windowTitle!content.title!}</title>
    <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/hello-magnolia/webresources/css/hello-style.css" media="all" />
  </head>
  <body>
    <div class="container">
	    [@cms.area name="navigation"/]
      <h1>${content.windowTitle!content.title!} works!</h1> 

      <div class="main">
	    [@cms.area name="main"/]
      </div>

      <div class="footer">
	[@cms.area name="footer"/]
      </div>
    </div>	

  </body>
</html>

