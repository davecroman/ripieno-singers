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
            <div class="animated fadeIn">
              <%@ include file="templates/article.jspf" %>
            </div>
        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>