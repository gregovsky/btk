[#global path = []]
[#macro breadcrumb page=(cmsfn.page(content))]
    [#global path = path + [page]]
    [#if cmsfn.parent(page)?has_content]
        [@breadcrumb cmsfn.parent(page) /]
    [/#if]
[/#macro]

<div class="${ctx.pageParameters.main_container!"container"}">
    <ol class="breadcrumb">
      [@breadcrumb /]
      [#list path?reverse as item]
        [#if item != cmsfn.page(content)]
            <li><a href="${cmsfn.link(item)!"#"}">${item.title!item.@name}</a></li>
        [#else]
          <li class="active">${item.title!item.@name}</li>
        [/#if]
      [/#list]
    </ol>
</div>



