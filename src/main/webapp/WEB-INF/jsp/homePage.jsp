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
                        <a style="display:flex" onclick="showComingSoonMessage()"><i class="fa fa-pencil"></i> Manage </a>
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

            <%---------- HEADLINE SECTION ----------%>
            <c:if test="${not empty headlineArticle}">
                <c:set var="sectionContent" value="${headlineArticle.getContent()}" scope="page"/>
                <c:set var="articleId" value="${headlineArticle.getId()}" scope="page"/>

                <div>
                    <div class="subheader">Headline</div>
                    <sec:authorize access="hasRole('ADMIN')">
                        <div style="width: 100%;text-align: center;margin: 15px 0;">
                            <a class="ripieno-button" onclick="editHeadline();">
                                <i class="fa fa-pencil"></i> Change
                            </a>
                        </div>
                    </sec:authorize>
                </div>

                <div id="headlineContent"
                     class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                    <div>
                        <b style="font-size:20px">
                            <a href="/news/${headlineArticle.getId()}" style="color:#EEEEEE">
                                    ${headlineArticle.getTitle()}
                            </a>
                        </b>
                    </div>
                    <div>${sectionContent}</div>
                    <div style="width: 100%;text-align: center;margin-top: 15px;margin-bottom: 10px;">
                        <a class="ripieno-button" href="/news/${headlineArticle.getId()}">Read more</a>
                    </div>
                </div>

                <div id="headline-editor" class="popup-bg hide">
                    <div class="popup-container">
                        <h4 class="white-text">Change Headline</h4>
                        <form action="/home/changeHeadline" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div style="color:white;background-color: darkgreen; padding:10px"><b>How to determine id of
                                article:</b><br>
                                1. Go to the News section <br>
                                2. Open the article you want to feature <br>
                                3. Copy the number at the very end of the resulting URL
                            </div>
                            <input id="article-id" name="articleId" style="color:white;font-size:20px" type="text"
                                   placeholder="Article ID" required/>
                            <div style="display:flex;background-color:rgba(255,255,255,0.2)">
                                <a class="ripieno-button2" onclick="$('#headline-editor').addClass('hide')">
                                    Back </a>
                                <button class="ripieno-button2" type="submit"> Change</button>
                            </div>
                        </form>
                    </div>
                </div>

                <script>
                    function editHeadline() {
                        $('#headline-editor').removeClass("hide");
                        $('#article-id').focus();
                    }
                </script>
            </c:if>

            <%---------- SERVICES SECTION ----------%>
            <c:set var="sectionName" value="${servicesSection.getSectionName()}" scope="page"/>
            <c:set var="sectionContent" value="${servicesSection.getContent()}" scope="page"/>
            <c:set var="sectionId" value="${servicesSection.getId()}" scope="page"/>
            <c:set var="contentName" value="servicesContent" scope="page"/>

            <div>
                <div class="subheader">${sectionName}</div>
                <sec:authorize access="hasRole('ADMIN')">
                    <div style="width: 100%;text-align: center;margin: 15px 0;">
                        <a class="ripieno-button"
                           onClick="editSection('${sectionName}', $('#${contentName}'), ${sectionId})">
                            <i class="fa fa-pencil"></i> Edit
                        </a>
                    </div>
                </sec:authorize>
            </div>

            <div class="text-block with-margin-left-right animated fadeIn">
                <div id="${contentName}"
                     class="grey-text text-lighten-2">
                    ${sectionContent}
                </div>
                <div style="width: 100%;text-align: center;margin-top: 15px;margin-bottom: 10px;">
                    <a class="ripieno-button" href="/contactUs">Get in touch</a>
                </div>
            </div>
        </div>

        <div class="right-column">
            <%---------- INTRO SECTION ----------%>
            <c:set var="sectionName" value="${introSection.getSectionName()}" scope="page"/>
            <c:set var="sectionContent" value="${introSection.getContent()}" scope="page"/>
            <c:set var="sectionId" value="${introSection.getId()}" scope="page"/>
            <c:set var="contentName" value="introContent" scope="page"/>
            <div class="header" style="margin:10px;">
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
            <div class="text-block with-margin-left-right animated fadeIn">
                <div id="${contentName}" class="grey-text text-lighten-2">
                    ${sectionContent}
                </div>
                <div style="width: 100%;text-align: center;margin-top: 15px;margin-bottom: 10px;">
                    <a class="ripieno-button" href="/aboutUs">Learn More</a>
                </div>
            </div>

            <%---------- WELCOME VIDEO ----------%>
            <sec:authorize access="hasRole('ADMIN')">
                <div style="width: 100%;margin: auto;display:flex;">
                    <div style="width:100%"><h4 class="grey-text">Welcome Video</h4></div>
                    <div class="ripieno-button">
                        <a style="display:flex" onclick="showComingSoonMessage()"><i class="fa fa-pencil"></i> Manage </a>
                    </div>
                </div>
            </sec:authorize>
            <div class="video-container responsive-video" style="text-align:center">
                <iframe width="490" height="281" src="https://www.youtube.com/embed/yEA6uogFc9c?controls=1&showinfo=1"
                        frameborder="0" allowfullscreen></iframe>
            </div>

            <%---------- DID YOU KNOW ----------%>
            <div>
                <div class="subheader"> Did you know?</div>
                <sec:authorize access="hasRole('ADMIN')">
                    <div style="width: 100%;margin: auto;text-align: center;margin: 15px 0;">
                        <a class="ripieno-button" onclick="showComingSoonMessage()">
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

    function showComingSoonMessage(){
        Materialize.toast('This feature is coming soon', 3000)
    }
</script>

</body>

</html>

