[#compress]
    [#include "../../includes/ftls/divClass.inc.ftl"]
    [#assign page = cmsfn.page(content)]
    <div class="${divClass!}">
        <h1>${content.title!page.title!}</h1>
        ${cmsfn.decode(content).desc!("<p>"+(page.description!)+"</p>")}
    </div>
[/#compress]