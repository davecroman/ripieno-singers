<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers</title>
    <%@ include file="templates/head.jspf" %>

    <meta property="og:title" content="The Ripieno Singers"/>
    <meta property="og:description"
          content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. "/>
    <meta property="og:image" content="https://ripienosingers.herokuapp.com/resources/jpg/welcomebg.jpg"/>

    <meta name="description"
          content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. "/>
</head>

<body>
<%@ include file="templates/header.jspf" %>

<main>
    <c:if test="${not empty notifications}">
        <div class="wrap" style="width:100%;display:block;">
            <%@ include file="templates/notifications.jspf" %>
        </div>
    </c:if>

    <div class="center-align animated fadeIn">
        <img src="/resources/png/logo_white.png" height="200px">
    </div>

    <c:set var="sectionAction" value="/home/updateSection" scope="page"/>
    <%@ include file="templates/sectionEditor.jspf" %>
    <div class="wrap">
        <div class="left-column">
            <sec:authorize access="hasRole('ADMIN')">
                <div style="width: 100%;margin: auto;display:flex;">
                    <div style="width:100%"><h4 class="grey-text">Slider</h4></div>
                    <div class="ripieno-button">
                        <a href="#" style="display:flex"><i class="fa fa-pencil"></i> Manage </a>
                    </div>
                </div>
            </sec:authorize>
            <div class="slider">
                <ul class="slides">
                    <li>
                        <img src="/resources/slider/1.png">
                        <div class="caption left-align bottomized shadowed-text">
                            <h5>With Sir Mark Carpio</h5>
                            <p class="light white-text">The chorale with Sir Mark Carpio, the choir master of the world
                                renowned Philippine Madrigal Singers</p>
                        </div>
                    </li>

                    <li>
                        <img src="/resources/slider/2.png">
                        <div class="caption left-align bottomized shadowed-text">
                            <h5>News To Go</h5>
                            <p class="light white-text">The group with Ms. Kara David and Mr. Howie Severino of GMA
                                News' News To Go after being featured and interviewed in their segment</p>
                        </div>
                    </li>
                    <li>
                        <img src="/resources/slider/3.png">
                        <div class="caption left-align bottomized shadowed-text">
                            <h5>With Ms. Jessica Soho</h5>
                            <p class="light white-text">A photo opportunity with Ms. Jessica Soho featuring PUPLHS
                                Chorale in Kapuso Mo, Jessica Soho.</p>
                        </div>
                    </li>
                    <li>
                        <img src="/resources/slider/4.png">
                        <div class="caption left-align bottomized shadowed-text">
                            <h5>With Ms. Lani Misalucha</h5>
                            <p class="light white-text">A photo taken with the Asia's Nightingale, Lani Misalucha, after
                                shooting a clip for GMA News' show Follow That Star</p>
                        </div>
                    </li>
                    <li>
                        <img src="/resources/slider/5.png">
                        <div class="caption right-align shadowed-text">
                            <h5>Unang Hirit Guesting</h5>
                            <p class="light white-text">Unang Hirit guesting of PUPLHS Chorale with its lovely hosts
                                Lhar Santiago, Lyn Ching-Pascual, Arnold Clavio, and Rhea Santos</p>
                        </div>
                    </li>
                    <li>
                        <img src="/resources/slider/6.png">
                        <div class="caption left-align bottomized shadowed-text">
                            <h5>Unang Hirit Guesting</h5>
                            <p class="light white-text">After winning a Gold diploma and placing second in Mixed Youth
                                Choir Category from the 1st Vietnam International Choir Festival and Competition held in
                                Hoi An, Quang Nam, Vietnam</p>
                        </div>
                    </li>
                </ul>
            </div>
            <c:set var="sectionName" value="${servicesSection.getSectionName()}" scope="page"/>
            <c:set var="sectionContent" value="${servicesSection.getContent()}" scope="page"/>
            <c:set var="sectionId" value="${servicesSection.getId()}" scope="page"/>
            <c:set var="contentName" value="servicesContent" scope="page"/>

            <div>
                <div class="subheader">${sectionName}</div>
                <sec:authorize access="hasRole('ADMIN')">
                    <div style="width: 100%;text-align: center;margin: 15px 0;">
                        <a class="ripieno-button" href="#"
                           onClick="editSection('${sectionName}', $('#${contentName}'), ${sectionId})">
                            <i class="fa fa-pencil"></i> Edit
                        </a>
                    </div>
                </sec:authorize>
            </div>

            <div id="${contentName}" class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                ${sectionContent}
            </div>

            <div>
                <div class="subheader"> Did you know?</div>
                <sec:authorize access="hasRole('ADMIN')">
                    <div style="width: 100%;margin: auto;text-align: center;margin: 15px 0;">
                        <a class="ripieno-button" href="#">
                            <i class="fa fa-pencil"></i> Manage
                        </a>
                    </div>
                </sec:authorize>
            </div>

            <p class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                <b class="white-text"> Ephraim Gianan </b> is the only member able to attend all major competitions
                joined by the group here (Davao) and abroad (Malaysia, Vietnam, Guam).
            </p>
        </div>

        <div class="right-column">
            <c:set var="sectionName" value="${introSection.getSectionName()}" scope="page"/>
            <c:set var="sectionContent" value="${introSection.getContent()}" scope="page"/>
            <c:set var="sectionId" value="${introSection.getId()}" scope="page"/>
            <c:set var="contentName" value="introContent" scope="page"/>
            <div class="header">
                ${sectionName}
            </div>

            <sec:authorize access="hasRole('ADMIN')">
                <div style="width: 100%;text-align: center;margin: 15px 0;display:flex">
                    <a class="ripieno-button" style="float: right;" href="#"
                       onClick="editSection('${sectionName}', $('#${contentName}'), ${sectionId})">
                        <i class="fa fa-pencil"></i> Edit
                    </a>
                </div>
            </sec:authorize>
            <div id="${contentName}" class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                ${sectionContent}
            </div>

            <sec:authorize access="hasRole('ADMIN')">
                <div style="width: 100%;margin: auto;display:flex;">
                    <div style="width:100%"><h4 class="grey-text">Welcome Video</h4></div>
                    <div class="ripieno-button">
                        <a href="#" style="display:flex"><i class="fa fa-pencil"></i> Manage </a>
                    </div>
                </div>
            </sec:authorize>
            <div class="video-container responsive-video" style="text-align:center">
                <iframe width="490" height="281" src="https://www.youtube.com/embed/yEA6uogFc9c?controls=1&showinfo=1"
                        frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</main>

<%@ include file="templates/footer.jspf" %>

<script>
    (function ($) {
        $(function () {
            $('.slider').slider();
        }); // end of document ready
    })(jQuery); // end of jQuery name space

    function onSubmit() {
        $('#sectionContent').val(editor.getHTML());
    }
</script>

<%@ include file="templates/script.jspf" %>
</body>

</html>

