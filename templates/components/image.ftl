[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]

    [#assign imageStyle = "img-responsive "+content.imageStyle!]

    [#assign lightbox = content.lightbox!false]

    [#if content.image?has_content && damfn.getAssetLink(content.image)?has_content]
        [#assign imageLink = damfn.getAssetLink(content.image)]
        [#assign target = damfn.getAsset(content.image)]
        [#assign link = target.link]
        [#assign assetMap = damfn.getAssetMap(target)]
        [#assign altText = assetMap.title!assetMap.name!"Image"]
    [#else]
        [#assign imageLink = ctx.contextPath+"/.resources/btk/webresources/img/placeholder.jpg"]
        [#assign altText = "placeholder"]
        [#assign lightbox = false]
    [/#if]

    <div class="${divClass!}">
        <div class="imageBox">
            [#if (lightbox = true) && !cmsfn.editMode]<a  data-toggle="modal" data-target="#myModal_${content.@id}">[/#if]
            <img class='img-responsive ${imageStyle}' src='${imageLink}' alt='${altText}'>
            [#if (lightbox = true) && !cmsfn.editMode]</a>[/#if]
        </div>
        [#--[#if content.caption?has_content]--]
            [#--<div class="imageCaption">${content.caption}</div>--]
        [#--[/#if]--]
        [#if (lightbox = true)  && !cmsfn.editMode]
            <div class="modal fade" id="myModal_${content.@id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog ${content.modalSize!"modal-lg"}">
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="${link!imageLink}" class='img-responsive'>
                        </div>
                    </div>
                </div>
            </div>
        [/#if]
    </div>

[/#compress]