[#assign divClass = def.parameters.divClass!""]
[#if content.divClass?has_content]
    [#assign divClass = divClass + " " + content.divClass]
[/#if]