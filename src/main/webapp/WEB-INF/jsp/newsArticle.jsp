<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>${article.getTitle()}</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>
    <meta property="og:description" content="${fn:substring(article.getContent(), 0, 100)}" />
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <div class="wrap">

            <div class="animated fadeIn expand">
              <%@ include file="templates/notifications.jspf" %>

              <sec:authorize access="hasRole('ADMIN')">
                <c:if test = "${type == 'confirmDeletion'}">
                  <div class="row center warning-message text-block">
                    <div style="width:100%;text-align:left"> Are you sure you want to delete this article? </div>
                    <div style="display:flex;">
                      <div style="margin: 0px 10px;"> <a href="/news/${article.getId()}/delete" class="ripieno-button"> YES </a> </div>
                      <div style="margin: 0px 10px;"> <a href="/news" class="ripieno-button"> BACK </a> </div>
                    </div>
                  </div>
                </c:if>
              </sec:authorize>

              <%@ include file="templates/article.jspf" %>

            </div>

        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>