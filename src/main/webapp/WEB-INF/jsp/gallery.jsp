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
    <%@ include file="templates/notificationPool.jspf" %>

    <sec:authorize access="hasRole('ADMIN')">
        <%@ include file="templates/imageAdder.jspf" %>
        <%@ include file="templates/imageRemover.jspf" %>
    </sec:authorize>

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
                <a class="ripieno-button">
                    <i class="fa fa-cog"></i> Manage tabs
                </a>
            </div>
        </sec:authorize>

        <div>
            <div class="gallery-tab-bar">
                <c:forEach items="${tabs}" var="tab">
                    <div class="ripieno-button2 gallery-tab ${tab.getName() == '2009'? 'selected-tab':''}"
                         onclick="loadImagesFromTab(${tab.getName()})" }>
                            ${tab.getName()}
                    </div>
                </c:forEach>
            </div>
            <div id="gallery-images" class="gallery-container">
                <sec:authorize access="hasRole('ADMIN')">
                    <div class="required row center" style="width:100%;margin:20px; text-align: center">
                        <a class="ripieno-button" style="margin-right:10px;" onclick="showImageAdder()">
                            <i class="fa fa-plus"></i> Add images
                        </a>
                    </div>
                </sec:authorize>
                <div id="loading-circle" class="required preloader-wrapper big active" style="margin:10px">
                    <div class="spinner-layer spinner-blue-only">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="gap-patch">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<%@ include file="templates/footer.jspf" %>
</body>

<script>
    var isLoadingImagesFromTab = false;
    $(document).ready(function () {
        /* Enable materialize for selections */
        $('select').material_select();

        /* Select default tab */
        var selectedTab = $(".selected-tab");
        $(".gallery-tab").click(function (event) {
            selectedTab.removeClass("selected-tab");
            $(this).addClass("selected-tab");
            selectedTab = $(this);
        });
        loadImagesFromTab('2009');

        addRow();

        setupAJAX();
    });

    function setupAJAX() {
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    };


    function loadImagesFromTab(tabName) {
        if (isLoadingImagesFromTab) {
            return;
        }
        isLoadingImagesFromTab = true;
        $('#gallery-images').children().not('.required').remove();
        $('#loading-circle').removeClass('hide');
        $.ajax({
            type: "GET",
            url: "/gallery/" + tabName,
            headers: {
                'Accept': 'application/json'
            },
            complete: function () {
                isLoadingImagesFromTab = false;
            },
            success: function (response) {
                $('#loading-circle').addClass('hide');
                $('#gallery-images').append(response);
                $('.admin-image-button').on('click', function () {
                    return false;
                });
            }
        });
        $('#image-tab').val(tabName);
        $('#current-tab-name').text(tabName);
    }

    function showImageAdder() {
        $('#imageAdder').removeClass('hide');
    }

</script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="/resources/js/jquery.image-gallery.min.js"></script>

</html>