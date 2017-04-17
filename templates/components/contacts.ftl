[#compress]
    [#include "../../includes/ftls/divClass.inc.ftl"]

    <div class="${divClass!}">
    [#assign selector = state.getSelector()!]
    [#if selector?has_content]
        [#assign item = cmsfn.contentByPath('/'+state.getSelector(),'contacts')!]
        [#if item?has_content]
            <div class="row">
                <div class="col-xs-12">
                  <h1>${(item.firstName!)+" "+(item.lastName!)}</h1>
                </div>
            </div>
            <div class="row">
              <div class="col-xs-12 col-sm-4">
                  [#if item.photo?has_content]
                    <img src="${cmsfn.link(item.photo)!}" alt="${(item.firstName!)+" "+(item.lastName!)}" class="img-responsive img-thumbnail"/>
                  [/#if]
              </div>
                <div class="col-xs-12 col-sm-8">
                    <p>${item.organizationName!}</p>
                    <p>${item.email!}</p>
                </div>
            </div>
        [/#if]

        <div class="row">
          <div class="col-xs-12">
            <ul class="pager">
              <li class="previous"><a href="${cmsfn.link(cmsfn.page(content)!)!}"><span aria-hidden="true">&larr;</span> ${i18n['components.contacts.backToAll']}</a></li>
            </ul>
          </div>
        </div>
    [#else]
        <div class="row">
            <div class="col-xs-12">
                <h1>${i18n['components.contacts.contactsList']}</h1>
                [#assign listRoot = cmsfn.contentByPath("/","contacts")!]
                [#assign list = cmsfn.children(listRoot,"mgnl:contact")!]
                [#if list?size > 0]
                    <div class="list-group">
                    [#list list as item]
                        [#--<a href="${cmsfn.link(cmsfn.page(content))?replace('.html','~'+item.@name+'~.html')}" class="list-group-item">${(item.firstName!)+" "+(item.lastName!)} <span class="label label-default">${item.organizationName!}</span></a>--]
                        [#-- experimentally use navfn --]
                        [#-- TODO: clean this comments --]
                        <a href="${navfn.linkWithSelector(cmsfn.page(content), item)!"#"}" class="list-group-item">${(item.firstName!)+" "+(item.lastName!)} <span class="label label-default">${item.organizationName!}</span></a>

                    [/#list]
                    </div>
                [/#if]
            </div>
        </div>
    [/#if]
[/#compress]