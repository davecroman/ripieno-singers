<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>${article.getTitle()}</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>

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
                    <div> Are you sure you want to delete this article? </div>
                    <div> <a href="/news/${article.getId()}/delete" class="ripieno-button"> Yes </a> </div>
                    <div> <a href="/news" class="ripieno-button"> Go back to News </a> </div>
                  </div>
                </c:if>
              </sec:authorize>

              <%@ include file="templates/article.jspf" %>
              <%@ include file="templates/share.jspf" %>
            </div>

        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>