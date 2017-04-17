[#macro link]
    [#if content.link = "internal"]
        [#if content.linkinternal?has_content]
            [#assign target = cmsfn.contentById(content.linkinternal)!]
            [#if target?has_content]
                [#assign link = cmsfn.link(target)]
                [#assign siteTitle = content.label!target.title!"link"]
                [#assign siteText = target.description!]
            [#else]
                [#assign link = "#"]
                [#assign siteTitle = "<span class='showOnlyInEditMode'>NO_LINK_EXIST inter</span>&nbsp"]
            [/#if]
        [#else]
            [#assign link = "#"]
            [#assign siteTitle = "&nbsp;"]
        [/#if]


    [#elseif content.link = "external"]
        [#if content.linkexternal?has_content]
            [#assign link = content.linkexternal]
            [#assign siteTitle = content.label!content.linkexternal]
        [#else]
            [#assign link = "#"]
            [#assign siteTitle = "<span class='showOnlyInEditMode'>NO_LINK_EXIST ext</span>&nbsp"]
        [/#if]


    [#elseif content.link = "dam"]
        [#if content.linkdam?has_content]
            [#assign target = damfn.getAsset(content.linkdam)]
            [#assign link = target.link]
            [#assign assetMap = damfn.getAssetMap(target)]
            [#assign siteTitle = content.label!assetMap.title!"link"]
            [#assign siteText = assetMap.caption!assetMap.description!]
        [#else]
            [#assign link = "#"]
            [#assign siteTitle = "<span class='showOnlyInEditMode'>NO_ASSET_WAS_SET</span>&nbsp"]
        [/#if]


    [#elseif content.link = "contact"]
        [#assign contactsPage = cmsfn.contentByPath("/btk-demo/contacts")!]
        [#if content.linkcontact?has_content && contactsPage?has_content && cmsfn.contentById(content.linkcontact,"contacts")?has_content]
            [#assign target = cmsfn.contentById(content.linkcontact,"contacts")]
            [#assign link = cmsfn.link(contactsPage)?replace('.html','~'+target.@name+'~.html')]
            [#assign siteTitle = content.label!((target.firstName!)+" "+(target.lastName!))]
            [#assign siteText = target.organizationName!]
        [#else]
            [#assign link = "#"]
            [#assign siteTitle = "<span class='showOnlyInEditMode'>NO_CONTACT</span>&nbsp"]
        [/#if]


    [/#if]
[/#macro]
