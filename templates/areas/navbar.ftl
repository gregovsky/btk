[#assign root = cmsfn.root(content, "mgnl:page")!content ]
<nav class="${def.parameters.navbar_class!"navbar navbar-inverse"}">
  <div class="${def.parameters.navbar_container!"container"}">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${cmsfn.link(root)!"#"}"><img src="${ctx.contextPath}/.resources/btk/webresources/img/btk_logo.png" alt="${content.title!content.@name}" style="height:40px; margin-top: -10px;" /></a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">

        [#--[#include "navigation.ftl"]--]
        [#include "navigationWithNavfn.ftl"]
    </div>
  </div>
</nav>