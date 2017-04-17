[#compress]

    [#include "../../includes/ftls/divClass.inc.ftl"]

    <div class="${divClass!}">
        ${cmsfn.decode(content).editHTML}
    </div>

[/#compress]