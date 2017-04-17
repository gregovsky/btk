[#compress]
    [#include "../../includes/ftls/divClass.inc.ftl"]

    <div class="${divClass!}">

        [#assign queryStr = ctx.getParameter("queryStr")!?html]

        [#if queryStr?has_content]

            <h1>${i18n['components.search.searchResultsFor']} '${queryStr}':</h1>


            [#-- SEARCH IN PAGES --]
            [#assign searchResultsPages = searchfn.searchPages(queryStr, "/"+cmsfn.root(content, "mgnl:page")!content) /]
            [#if searchResultsPages?has_content]
                [#list searchResultsPages as item]
                    [#assign pageLink = cmsfn.link(item)]
                  <blockquote>
                    <h4><a href="${pageLink!}">${item.navigationTitle!item.title!item.@name!}</a></h4>
                    ${item.excerpt!}
                    <footer><a href="${pageLink!}">${pageLink!}</a></footer>
                  </blockquote>
                [/#list]
            [/#if]

            [#-- SEARCH IN CONTACTS --]
            [#assign contactsPage = cmsfn.contentByPath("/btk-demo/contacts")!]
            [#if contactsPage?has_content]
                [#assign searchResultsContacts = searchfn.searchContent("contacts", queryStr, "%", "mgnl:contact") /]
                [#if searchResultsContacts?has_content]
                    [#list searchResultsContacts as item]
                    [#--[#assign contactLink = cmsfn.link(contactsPage)?replace('.html','~'+item.@name+'~.html')]--]
                    [#-- experimentally use navfn --]
                    [#-- TODO: clean this comments --]
                    [#assign contactLink = navfn.linkWithSelector(contactsPage, item)!"#"]

                    <blockquote>
                      <h4><a href="${contactLink}">${(item.firstName!)+" "+(item.lastName!)}</a></h4>
                      ${item.excerpt!}
                      <footer><a href="${contactLink!}">${contactLink!}</a></footer>
                    </blockquote>
                    [/#list]
                [/#if]
            [/#if]

        [/#if]

    </div>
[/#compress]