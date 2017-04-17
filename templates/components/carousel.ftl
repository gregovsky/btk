[#compress]
    [#include "../../includes/ftls/divClass.inc.ftl"]
    [#assign carouselId = "carousel_"+content.@id?keep_before("-")]

<div id="${carouselId}" class="${divClass!}" data-ride="carousel">

    <!-- Indicators -->
    [#if content.slides?has_content && cmsfn.children(content.slides)?size > 1]
        <ol class="carousel-indicators">
        [#list cmsfn.children(content.slides) as slide ]
            [#if slide_index = 0]
                <li data-target="#${carouselId}" data-slide-to="0" class="active"></li>
            [#else]
                <li data-target="#${carouselId}" data-slide-to="${slide_index}"></li>
            [/#if]
        [/#list]
        </ol>
    [/#if]

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

        [#if content.slides?has_content ]
            [#list cmsfn.children(content.slides) as slide ]
                [#if slide_index = 0]
                    <div class="item active">
                [#else]
                    <div class="item">
                [/#if]
                [#if slide.background?has_content]
                    [#assign bg = damfn.getAssetLink(slide.background)!]
                    <img src="${bg!}" alt="${slide.linkLabel!"image"}">
                [#else]
                    <div class="carousel-placeholder embed-responsive-16by9"></div>
                [/#if]
                    <div class="carousel-caption">
                        <h2>${slide.title!}</h2>
                        ${cmsfn.decode(slide).abstract!}
                        [#if slide.link?has_content]
                            [#assign target = cmsfn.contentById(slide.link)!]
                            [#if target?has_content]
                                [#assign link = cmsfn.link(target)]
                                [#assign siteTitle = slide.linkLabel!target.title!"link"]
                                [#assign siteText = target.description!]
                                <p><a class="btn" href="${link!}" role="button">${siteTitle!}</a></p>
                            [/#if]
                        [/#if]
                    </div>
                </div>
            [/#list]
        [/#if]

    </div>

    <!-- Controls -->
    [#if content.slides?has_content && cmsfn.children(content.slides)?size > 1]
        <a class="left carousel-control" href="#${carouselId}" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#${carouselId}" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    [/#if]

</div>
[/#compress]