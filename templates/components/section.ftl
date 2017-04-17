[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]

    [#if content.title?has_content]
        [#if content.titleSize?has_content && content.titleSize != "-"]
            [#assign titleSize = content.titleSize]
        [/#if]
        <${titleSize!"h2"}>${content.title}</${titleSize!"h2"}>
    [/#if]

    [#if !(content.layout?has_content)]
      [#assign colums = ["col-xs-12"]]
    [#else]
      [#assign colums = content.layout?split(",")]
    [/#if]

    <div class="${divClass!}">

      [#if colums?has_content ]
        [#assign total = colums?size!0]
        [#list colums as component]
          <div class="${component}">
            [@cms.area name="col"+(component_index+1) contextAttributes={"index":component_index,"total":total,"parity":(component_index % 2 == 0)?string("even","odd"),"has_next":component_has_next}/]
          </div>
        [/#list]
      [/#if]

    </div>

[/#compress]