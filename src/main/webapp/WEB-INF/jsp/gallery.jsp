<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - Gallery</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/south-street/jquery-ui.css"
          id="theme">
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/gallery.css"/>
</head>

<body>
<%@ include file="templates/header.jspf" %>


<main>
    <c:if test="${not empty notificationPool}">
        <div class="wrap" style="width:100%;display:block;">
            <c:set var="notificationCount" value="0" scope="page" />
            <c:forEach items="${notificationPool.popSuccessMessages()}" var="notificationMessage">
                <c:set var="notificationCount" value="${notificationCount+1}" scope="page" />
                <c:set var="notificationId" value="${'notification'.concat(notificationCount)}" scope="page" />
                <div id="${notificationId}" style="color: white; background-color: darkgreen; padding: 10px; display: flex; margin-bottom: 5px;">
                    <div style="width: 100%; padding: 5px;"> ${notificationMessage} </div>
                    <div style="text-align: right;"> <a class="fa fa-times fa-2x" onclick="$('#${notificationId}').addClass('hide')"></a> </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <!-- The dialog widget -->
    <div id="blueimp-gallery-dialog" data-show="fade" data-hide="fade">
        <!-- The gallery widget  -->
        <div class="blueimp-gallery blueimp-gallery-carousel blueimp-gallery-controls">
            <div class="slides"></div>
            <a class="prev"><i class="fa fa-chevron-left"></i></a>
            <a class="next"><i class="fa fa-chevron-right"></i></a>
        </div>
    </div>

    <div class="wrap" style="display:block;">


        <div class="center-align animated fadeIn">
            <img src="/resources/png/logo_white.png" height="200px">
        </div>

        <sec:authorize access="hasRole('ADMIN')">
            <div class="row center">
                <a class="ripieno-button" style="margin-right:10px;">
                    <i class="fa fa-plus"></i> Add images
                </a>
                <a class="ripieno-button">
                    <i class="fa fa-cog"></i> Manage tabs
                </a>
            </div>
        </sec:authorize>

        <div>
            <div class="gallery-tab-bar">
                <c:forEach items="${tabs}" var="tab">
                    <div class="ripieno-button2 gallery-tab ${tab.getName() == '2009'? 'selected-tab':''}" onclick="loadImagesFromTab(${tab.getName()})"}>
                        ${tab.getName()}
                    </div>
                </c:forEach>
            </div>
            <div id="links" class="gallery-container">
                <a class="gallery-item" href="https://i.ytimg.com/vi/NPal5JKNBlI/maxresdefault.jpg" title="Banana"
                   data-dialog>
                    <img class="gallery-image" src="https://i.ytimg.com/vi/NPal5JKNBlI/maxresdefault.jpg">
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="admin-image-panel">
                            <div class="admin-image-button"><i class="fa fa-times fa-2x"></i></div>
                            <div class="admin-image-button"><i class="fa fa-pencil fa-2x"></i></div>
                        </div>
                    </sec:authorize>
                </a>
                <a class="gallery-item" href="https://i.ytimg.com/vi/BDKSz2VrU6o/maxresdefault.jpg" title="Apple"
                   data-dialog>
                    <img class="gallery-image" src="https://i.ytimg.com/vi/BDKSz2VrU6o/maxresdefault.jpg" alt="Apple">
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="admin-image-panel">
                            <div class="admin-image-button"><i class="fa fa-times fa-2x"></i></div>
                            <div class="admin-image-button"><i class="fa fa-pencil fa-2x"></i></div>
                        </div>
                    </sec:authorize>
                </a>
                <a class="gallery-item" href="https://upload.wikimedia.org/wikipedia/en/4/4b/PUPLHS_Chorale_Performance.jpg" title="Banana"
                   data-dialog>
                    <img class="gallery-image" src="https://upload.wikimedia.org/wikipedia/en/4/4b/PUPLHS_Chorale_Performance.jpg">
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="admin-image-panel">
                            <div class="admin-image-button"><i class="fa fa-times fa-2x"></i></div>
                            <div class="admin-image-button"><i class="fa fa-pencil fa-2x"></i></div>
                        </div>
                    </sec:authorize>
                </a>
                <a class="gallery-item" href="https://i.ytimg.com/vi/m_n0ajM6gzo/hqdefault.jpg" title="Apple"
                   data-dialog>
                    <img class="gallery-image" src="https://i.ytimg.com/vi/m_n0ajM6gzo/hqdefault.jpg" alt="Apple">
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="admin-image-panel">
                            <div class="admin-image-button"><i class="fa fa-times fa-2x"></i></div>
                            <div class="admin-image-button"><i class="fa fa-pencil fa-2x"></i></div>
                        </div>
                    </sec:authorize>
                </a>
            </div>
            >
        </div>
    </div>
</main>


<%@ include file="templates/footer.jspf" %>
</body>

<script>
    $(document).ready(function () {
        var selectedTab = $(".selected-tab");
        $(".gallery-tab").click(function (event) {
            selectedTab.removeClass("selected-tab");
            $(this).addClass("selected-tab");
            selectedTab = $(this);
        });
    });

    $('.admin-image-button').on('click', function () {
        return false;
    });

    function loadImagesFromTab(tabName) {
        $.ajax({
            type: "GET",
            url: "/gallery/" + tabName,
            headers: {
                'Accept': 'application/json'
            },
            complete: function () {
                Materialize.toast('Images loaded successfully', 4000)
            },
            success: function(data) {
                console.log(data);
            }
        });
    }
</script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="/resources/js/jquery.image-gallery.min.js"></script>

</html>