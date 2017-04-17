[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]

    [#assign orientation = content.orientation!"imageOnLeft"]

    [#assign imageStyle = "img-responsive "+content.imageStyle!]

    [#assign imageSize = ""]
    [#if orientation = "imageOnLeft"]
        [#assign imageStyle = imageStyle+" pull-left"]
        [#assign imageSize = "style='width: 49%; margin: 0 2% 2% 0;'"]
    [#elseif orientation = "imageOnRight"]
        [#assign imageStyle = imageStyle+" pull-right"]
        [#assign imageSize = "style='width: 49%; margin: 0 0 2% 2%;'"]
    [/#if]

    [#assign renderImage = "<img class='"+imageStyle+"' "+imageSize+" src='${ctx.contextPath}/.resources/btk/webresources/img/placeholder.jpg' alt='placeholder'>"]
    [#if content.imageOrIcon?has_content]
        [#if content.imageOrIcon = "image" && content.imageOrIconimage?has_content && damfn.getAssetLink(content.imageOrIconimage)?has_content]
            [#assign imageLink = damfn.getAssetLink(content.imageOrIconimage)]
            [#assign target = damfn.getAsset(content.imageOrIconimage)]
            [#assign link = target.link]
            [#assign assetMap = damfn.getAssetMap(target)]
            [#assign altText = assetMap.title!assetMap.name!"Image"]
            [#assign image_icon = "<img class='"+imageStyle+"' "+imageSize+" src='"+imageLink+"' alt='"+altText+"'>"]
            [#assign renderImage = image_icon]
        [#elseif content.imageOrIcon = "icon"]
            [#assign image_icon = "<span class='"+content.imageOrIconicon+"' style='font-size: 500%' aria-hidden='true'></span>"]
            [#if orientation = "imageOnLeft"]
                [#assign renderImage = "<div class='pull-left'>"+image_icon+"</div>"]
            [#elseif orientation = "imageOnRight"]
                [#assign renderImage = "<div class='pull-right'>"+image_icon+"</div>"]
            [#else]
                [#assign renderImage = "<div class='text-center'>"+image_icon+"</div>"]
            [/#if]
        [/#if]
    [/#if]

    [#assign renderText = cmsfn.decode(content).text!""]
    [#if content.title?has_content]
        [#if content.titleSize?has_content && content.titleSize != "-"]
            [#assign titleSize = content.titleSize]
        [/#if]
        [#assign renderText = "<"+(titleSize!"h4")+">"+(content.title!"")+"</"+(titleSize!"h4")+">"+renderText]
    [/#if]

    <div class="${divClass!}">
        [#if orientation != "imageOnBottom" && orientation != "noImage"]
            ${renderImage}
        [/#if]
        [#if orientation != "noText"]
            ${renderText}
        [/#if]
        [#if orientation = "imageOnBottom"]
            ${renderImage}
        [/#if]
    </div>

[/#compress]