<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - Members</title>
    <%@ include file="templates/head.jspf" %>
    <meta name="description" content="Get to know us more! View our member profiles."/>
</head>

<body>
<%@ include file="templates/header.jspf" %>

<main>
    <c:if test="${not empty notifications}">
        <div class="wrap" style="width:100%;display:block;">
            <%@ include file="templates/notifications.jspf" %>
        </div>
    </c:if>

    <div class="header grey-text text-lighten-5 animated fadeIn" style="margin: 25px;">
        Reorder Members
    </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <div class="wrap">
        <div style="width:90%;margin:auto">
            <div class="white-text text-block">
                Reorder members by dragging the panels below. Items at the top show first. Ordering is determined from
                left to right, top to bottom approach. Once finished, click the <b>Save Order</b> at the bottom of the page.
            </div>
            <ul id="items" class="collection" style="cursor: move;">
                <c:forEach items="${members}" var="member">
                    <li data-id=${member.getId()} class="collection-item avatar
                    ">
                    <img src="${member.getProfilePic()}" alt="" class="circle" style="width:50px;height:50px;">
                    <span class="title">${member.getName()}</span>
                    <p class="grey-text">${member.getTitle()}</p>
                    <p class="secondary-content"><i class="fa fa-bars"></i></p>
                    </li>
                </c:forEach>
            </ul>
            <div class="row center" style="margin:20px auto;">
                <a id="save-order" class="ripieno-button" onclick="reorderMembers()">
                    Save Order
                </a>
                <div id="loading-circle" class="preloader-wrapper small active hide">
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


    <script src="//cdnjs.cloudflare.com/ajax/libs/Sortable/1.4.2/Sortable.min.js"></script>

    <script>
        var items = document.getElementById('items');
        var sortable = Sortable.create(items, {
            animation: 150,
        });

        function reorderMembers() {
            function createSortData() {
                var idArray = sortable.toArray();
                var resultData = [];

                for (var index = 0; index < idArray.length; index++) {
                    resultData.push({id: idArray[index], order: index})
                }

                return resultData;
            }

            var sortData = createSortData();
            $("#save-order").addClass("hide");
            $("#loading-circle").removeClass("hide");
            $.ajax({
                type: "POST",
                url: "/members/reorder",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify(sortData),
                dataType: 'json',
                contentType: 'application/json',
                complete: function () {
                    $("#loading-circle").addClass("hide");
                    $("#save-order").removeClass("hide");
                    Materialize.toast('Ordering has been updated. Changes may take a while to reflect.', 4000)
                }
            });
        }
    </script>


    <div class="wrap" style="display:block">

    </div>
</main>

<%@ include file="templates/footer.jspf" %>
</body>

<script>
    function setupAJAX() {
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    }
    ;

    $(document).ready(function () {
        setupAJAX();
    });
</script>

</html>