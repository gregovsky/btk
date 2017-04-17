<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${content.windowTitle!content.title!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />

    <link rel="stylesheet" type="text/css"  href="${ctx.contextPath}/.resources/btk/webresources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css"  href="${ctx.contextPath}/.resources/btk/webresources/css/btkComponents.css"/>

  </head>
  <body class="${def.parameters.body_class!"home"} ${cmsfn.language()} [#if cmsfn.isEditMode()]editMode[/#if]">

    [#include "../areas/navbar.ftl"]

    [@cms.area name="breadcrumb" contextAttributes={"pageParameters":def.parameters!}/]

    <header class="${def.parameters.main_container!"container"}">
      [@cms.area name="header"/]
    </header>

    <section class="${def.parameters.main_container!"container"}">
      [@cms.area name="main"/]
    </section>

    <footer style="background-color: #eee; padding-top: 20px;">
      <div class="${def.parameters.main_container!"container"}">
        [@cms.area name="footer"/]
      </div>
    </footer>

    <script src="${ctx.contextPath}/.resources/btk/webresources/js/jquery.min.js"></script>
    <script src="${ctx.contextPath}/.resources/btk/webresources/js/bootstrap-min.js"></script>

  </body>
</html>
