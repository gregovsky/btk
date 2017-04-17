[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]
    [#include "../../includes/ftls/link.inc.ftl"]
    [@link /]

    [#if content.imageOrIcon?has_content]
        [#if content.imageOrIcon = "image" && content.imageOrIconimage?has_content]
            [#assign imageLink = damfn.getAssetLink(content.imageOrIconimage)]
            [#assign target = damfn.getAsset(content.imageOrIconimage)]
            [#assign assetMap = damfn.getAssetMap(target)!]
            [#assign altText = ""]
            [#if assetMap?has_content]
                [#assign altText = assetMap.title!assetMap.name!]
            [/#if]
            [#assign image_icon = "<img class='img-responsive' src='"+imageLink+"' alt='"+altText+"'>"]
        [#elseif content.imageOrIcon = "icon"]
            [#assign image_icon = "<span class='"+content.imageOrIconicon+"' aria-hidden='true' style='font-size: 500%'></span>"]
        [/#if]
    [/#if]

    <div class="${divClass!}">
        [#if image_icon?has_content]<div>${image_icon!}</div>[/#if]
        <div class="caption">
            [#if siteTitle?has_content || content.teaserTitle?has_content]<b class='h4'>${content.teaserTitle!siteTitle}</b>[/#if]
            [#if siteText?has_content || content.teaserAbstract?has_content]<p>${content.teaserAbstract!siteText}</p>[/#if]
            [#if link?has_content]<p><a class="btn ${content.linkStyle!} ${activeClass!}" href="${link}" role="button">${content.linkLabel!siteTitle}</a></p>[/#if]
        </div>
    </div>

[/#compress]