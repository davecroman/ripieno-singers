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
                <div class="row center" style="margin:10px;">
                  <a class="ripieno-button" href="/news/editor">
                    <i class="fa fa-plus"></i> Add an Article
                  </a>
                </div>
              </sec:authorize>

              <c:choose>
                  <c:when test="${not empty articles}">
                      <c:forEach items="${articles}" var="article">
                        <%@ include file="templates/article.jspf" %>
                      </c:forEach>
                  </c:when>
                  <c:otherwise>
                      <div class="no-news-message">
                        There are currently no news articles to show. The service may be down. Please try refreshing the page.
                      </div>
                  </c:otherwise>
              </c:choose>
            </div>
        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>