[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]

    [#assign link = content.link!]
    [#assign startTime = content.startTime!""]

    [#if state.originalBrowserURL?starts_with("https")]
        [#assign useHTTPS = true]
    [#else]
        [#assign useHTTPS = content.useHTTPS!false]
    [/#if]

    [#if link?has_content]

        [#assign urlParams = ""]
        [#macro addToUrlParams add]
            [#if urlParams != ""]
                [#assign urlParams = urlParams + "&"]
            [#else]
                [#assign urlParams = urlParams + "?"]
            [/#if]
            [#assign urlParams = urlParams + add]
        [/#macro]

        [#assign youtubeID = link]

        [#if link?index_of("//youtu.be/") > -1]
            [#assign youtubeIDs = link?split("//youtu.be/")]
            [#assign youtubeID = youtubeIDs[1]]
        [#elseif link?index_of("//www.youtube.com/watch?v=") > -1]
            [#assign youtubeIDs = link?split("//www.youtube.com/watch?v=")]
            [#assign youtubeID = youtubeIDs[1]]
        [/#if]

        [#if youtubeID?index_of("&") > -1]
            [#list youtubeID?split("&") as x]
                [#if x_index == 0]
                    [#assign youtubeID = x]
                [#else]
                    [@addToUrlParams x /]
                [/#if]
            [/#list]
        [/#if]

        [#assign videoURL = "//www.youtube.com/embed/" + youtubeID]

        [@addToUrlParams "showinfo=0"/]

        [#if startTime?has_content]
            [@addToUrlParams ("t=" + content.startTime)/]
        [/#if]
    [/#if]

    <div class="${divClass!}">
        [#if content.inPopup?has_content && content.inPopup == true]

            [#if content.icon?has_content]
                [#assign icon = "<span class='"+content.icon+"' aria-hidden='true'></span> "]
            [/#if]

            <!-- Sub heading -->
            <a class="play" data-toggle="modal" data-target="#modal_${content.@id}">
                ${icon!}${content.inPopupLinkLabel!}
            </a>

            <!-- Modal -->
            <div class="modal fade" id="modal_${content.@id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="embed-responsive embed-responsive-16by9" itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                        <iframe width="1170" height="642" src="${videoURL! + urlParams!}" frameborder="0" allowfullscreen class="embed-responsive-item" ></iframe>
                      </div>
                    </div>
                </div>
            </div>

        [#else]

            <div class="embed-responsive embed-responsive-16by9" itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                <iframe src='${videoURL! + urlParams!}' width="560" height="315" frameborder="0" allowfullscreen></iframe>
            </div>

        [/#if]
    </div>

[/#compress]