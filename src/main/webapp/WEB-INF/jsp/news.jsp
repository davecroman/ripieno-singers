<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - News</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <div class="wrap">
            <div class="animated fadeIn">

              <sec:authorize access="hasRole('ADMIN')">
                <div class="row center">
                  <button class="ripieno-button"> <i class="fa fa-plus"></i> Add an Article</button>
                </div>
              </sec:authorize>

              <c:forEach items="${articles}" var="article">
                <%@ include file="templates/article.jspf" %>
              </c:forEach>

            </div>
        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>