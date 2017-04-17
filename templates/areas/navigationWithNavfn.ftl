[#compress]
[#assign navRootPage = navfn.rootPage(content)!]

[#macro renderNavigation navParentItem depth=1]

    [#if navParentItem?has_content && depth > 0]
    <ul class="nav navbar-nav">

        [#assign navItems = navfn.navItems(navParentItem)]
        [#list navItems as navItem]

            [#if navfn.hasTemplate(navItem, "btk:pages/contacts") && navfn.isNotHiddenInNav(navItem)]

            [#-- DROPDOWN MENU FOR CONTACTS --]

              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">${navItem.navigationTitle!navItem.title!navItem.@name} <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="${cmsfn.link(navItem)}"><b>${i18n['navigation.contacts.allContacts']}</b></a></li>
                    [#assign navContentItems = navfn.navItemsFromApp("contacts", "/", "mgnl:contact")]
                    [#list navContentItems as navContentItem]
                      <li><a href="${navfn.linkWithSelector(navItem, navContentItem)!"#"}">${(navContentItem.firstName!)+" "+(navContentItem.lastName!)}</a></li>
                    [/#list]
                </ul>
              </li>

            [#elseif navfn.hasTemplate(navItem, "btk:pages/search") && navfn.isNotHiddenInNav(navItem)]

            [#-- SEARCH BOX --]

                [#assign queryStr = ctx.getParameter("queryStr")!?html]
                <form class="navbar-form navbar-right" action="${cmsfn.link(navItem)}" method="get">
                    <input name="queryStr" type="text" class="form-control" placeholder="${i18n['navigation.searchbox.placeholder']}" value="${queryStr!}">
                </form>

            [#else]

            [#-- REGULAR PAGES --]

                [#if navfn.isNotHiddenInNav(navItem)]
                    [#if navItem == content]
                        <li class="active">
                    [#else]
                        <li>
                    [/#if]

                        <a href="${navfn.link(navItem)!"#"}">${navItem.navigationTitle!navItem.title!navItem.@name}</a>
                        [@renderNavigation navItem depth-1 /]
                    </li>
                [/#if]

            [/#if]

        [/#list]
    </ul>
    [/#if]
[/#macro]

[@renderNavigation navParentItem=navRootPage /]
[/#compress]