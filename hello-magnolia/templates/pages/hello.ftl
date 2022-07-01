<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <title>${content.windowTitle!content.title!}</title>
    <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/hello-magnolia/webresources/css/bootstrap-grid-only.css" media="all" />
`    <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/hello-magnolia/webresources/css/shrink-images-in-columns.css" media="all" />
    <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/hello-magnolia/webresources/css/hello-style.css" media="all" />
  </head>
  <body>
	  [#-- Build language navigation. --]
[#assign localizedLinks = cmsfn.localizedLinks()!]
[#if localizedLinks?has_content]
   [#assign languages = localizedLinks?keys]
   <ul>
      [#list languages as lang]
      [#assign current = cmsfn.isCurrentLocale(lang)]
      [#-- Use "compress" to put "li" and "a" on one line to prevent white spaces. --]
      <li>[@compress single_line=true]
         [#-- Current locale should not be linked. --]
         [#if current]${lang!}[/#if]
         [#if !current]<a href="${localizedLinks[lang]!'#'}">${lang!}</a>[/#if]
      [/@compress]</li>
      [/#list]
   </ul>
[/#if]

    <div class="container">
	    [@cms.area name="navigation"/]
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

