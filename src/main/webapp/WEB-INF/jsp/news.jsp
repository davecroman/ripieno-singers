<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - News</title>
    <meta name="description" content="Get in touch with all the recent gigs and adventures of The Ripieno Singers Inc." />

    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <div class="wrap">
            <div class="animated fadeIn">

              <%@ include file="templates/notifications.jspf" %>

              <sec:authorize access="hasRole('ADMIN')">
                <div class="row center" style="margin:10px;text-align:right;margin-top:20px;">
                  <a class="ripieno-button" href="/news/editor">
                    <i class="fa fa-plus"></i> Add an Article
                  </a>
                </div>
              </sec:authorize>

              <c:if test="${not empty articles}">
                  <c:forEach items="${articles}" var="article">
                    <%@ include file="templates/article.jspf" %>
                  </c:forEach>
              </c:if>
            </div>
        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

</html>