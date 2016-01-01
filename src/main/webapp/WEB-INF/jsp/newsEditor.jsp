<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>Add an Article</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <c:if test="${not empty notifications}">
           <div class="wrap" style="width:100%;display:block;">
            <%@ include file="templates/notifications.jspf" %>
           </div>
         </c:if>
        <div class="wrap">
          <div id="article-form" style="width:100%;height:100%;">
              <h2 class="grey-text text-lighten-5 header">
                  <c:choose>
                    <c:when test="${actionType == 'add'}">
                      Add an Article
                    </c:when>
                    <c:otherwise>
                      Modify Article
                    </c:otherwise>
                  </c:choose>
              </h2>

              <div class="row">
                <div class="input-field col s12 white-text">
                <label for="titleInput">Title</label>
                <input id="titleInput" type="text" value="${title}" required>
                </div>
              </div>

              <div class="row">
                <%@ include file="templates/texteditor.jspf" %>
              </div>

              <div class="row center">
                <button class="ripieno-button" type="button" onclick="onFinish()">
                  Preview <i class="material-icons"></i>
                </button>
              </div>

              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </div>


          <div id="article-preview" class="hide" style="width:100%">
            <h2 id="title-preview" class="grey-text text-lighten-5 header"></h2>

            <p class="date">${date}</p>

            <p id="content-preview" class="news-content"></p>

            <form action="${actionType == 'add'? '/news/publish' : '/news/'.concat(articleId).concat('/modify') }" method="post">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <input type="hidden" id="title" name="title">
              <input type="hidden" id="content" name="content">
              <div class="row center">
                <button class="ripieno-button" type="button" onclick="onBack()">Back</button>
                <button class="ripieno-button" type="submit">
                  ${actionType == 'add'? 'Publish' : 'Update'}
                </button>
              </div>
            </form>
          </div>

        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

<script>
  function onFinish(){
    var title = $("#titleInput").val();
    var newsHTML = editor.getHTML();

    $("#article-form").addClass("hide");
    $("#article-preview").removeClass("hide");

    $("#title-preview").text(title);
    $("#content-preview").html(newsHTML);

    $("#title").val(title);
    $("#content").val(newsHTML);
  }

  function onBack(){
    $("#article-form").removeClass("hide");
    $("#article-preview").addClass("hide");
  }
</script>

</html>