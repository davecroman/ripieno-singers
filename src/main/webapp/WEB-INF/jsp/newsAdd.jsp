<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>Add an Article</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="/resources/css/editor.css" type="text/css"/>
    <link rel="stylesheet" href="//cdn.quilljs.com/0.20.1/quill.snow.css" />
    <link rel="stylesheet" href="/resources/css/news.css" type="text/css"/>

    <script src="//cdn.quilljs.com/0.20.1/quill.js"></script>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <div class="wrap">
          <div id="article-form" style="width:100%;height:100%;">
            <h2 class="grey-text text-lighten-5 header">
                Add an Article
            </h2>

              <div class="row">
                <div class="input-field col s12 white-text">
                <label for="titleInput">Title</label>
                <input id="titleInput" type="text" required>
                </div>
              </div>

              <%@ include file="templates/texteditor.jspf" %>

              <div class="row center">
                <button class="ripieno-button" type="button" onclick="onFinish()">
                  Preview <i class="material-icons"></i>
                </button>
              </div>

              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </div>


          <div id="article-preview" class="hide" style="width:100%">
            <h2 id="title-preview" class="grey-text text-lighten-5 header"></h2>

            <p class="date">
              ${date}
            </p>

            <p id="content-preview" class="news-content">

            </p>

            <form action="/news/publish" method="post">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <input id="title" name="title" type="hidden">
              <input id="content" name="content" type="hidden">
              <div class="row center">
                <button class="ripieno-button" type="button" onclick="onBack()">Back</button>
                <button class="ripieno-button" type="submit">Publish</button>
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