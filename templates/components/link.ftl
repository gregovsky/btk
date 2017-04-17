[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]
    [#include "../../includes/ftls/link.inc.ftl"]
    [@link /]

    [#if content.icon?has_content]
        [#assign icon = "<span class='"+content.icon+"' aria-hidden='true'></span> "]
    [/#if]

    <div class="${divClass!}">
        [#if link?has_content]
            <a class="btn ${content.linkStyle!} ${content.linkSize!} ${activeClass!}" href="${link}" role="button">${icon!}${siteTitle}</a>
        [/#if]
    </div>

[/#compress]