[#assign root = cmsfn.root(content, "mgnl:page")!content ]
[#assign maxDepth = 0]

[#macro navigation page=root depth=0]
  [#if cmsfn.children(page, "mgnl:page")?size > 0]
    <ul class="nav navbar-nav">
    [#list cmsfn.children(page, "mgnl:page") as child ]

      [#if (cmsfn.metaData(child, "mgnl:template") == "btk:pages/contacts") && (!child.hideInNav?has_content || child.hideInNav?string != "true")]

        [#-- DROPDOWN MENU FOR CONTACTS --]

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">${child.navigationTitle!child.title!child.@name} <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${cmsfn.link(child)}"><b>${i18n['navigation.contacts.allContacts']}</b></a></li>
              [#assign listRoot = cmsfn.contentByPath("/","contacts")!]
              [#assign list = cmsfn.children(listRoot,"mgnl:contact")!]
              [#list list as item]
                <li><a href="${cmsfn.link(child)?replace('.html','~'+item.@name+'~.html')}">${(item.firstName!)+" "+(item.lastName!)}</a></li>
              [/#list]
          </ul>
        </li>

      [#elseif (cmsfn.metaData(child, "mgnl:template") == "btk:pages/search") && (!child.hideInNav?has_content || child.hideInNav?string != "true")]

        [#-- SEARCH BOX --]
        [#assign queryStr = ctx.getParameter("queryStr")!?html]
        <form class="navbar-form navbar-right" action="${cmsfn.link(child)}" method="get">
          <input name="queryStr" type="text" class="form-control" placeholder="${i18n['navigation.searchbox.placeholder']}" value="${queryStr!}">
        </form>

      [#elseif !child.hideInNav?has_content || child.hideInNav?string != "true"]

        [#-- REGULAR PAGES --]

          [#if child == content]
          [#-- ON SAME PAGE (class=active) --]
          <li class="active"><a href='${cmsfn.link(child)!"#"}'>${child.navigationTitle!child.title!child.@name}</a>  
        [#else]
          <li><a href='${cmsfn.link(child)!"#"}'>${child.navigationTitle!child.title!child.@name}</a> 
        [/#if]
        [#if depth < maxDepth]
          [@navigation child depth+1 /]
        [/#if]
        </li>
      [/#if]
      
    [/#list]  
    </ul>   
  [/#if]
[/#macro]

[@navigation /]





