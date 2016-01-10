<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - Members</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" type="text/css" href="/resources/css/members.css"/>
    <meta name="description" content="Get to know us more! View our member profiles." />
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
        The Ripieno Singers Inc.
    </div>
    <%@ include file="templates/memberEditor.jspf" %>
    <div class="wrap" style="display:block">
        <sec:authorize access="hasRole('ADMIN')">
            <div class="row center">
                <a class="ripieno-button" onclick="addMember();">
                    <i class="fa fa-plus"></i> Add Member
                </a>
            </div>
        </sec:authorize>

        <c:if test="${empty members}">
            <div class="text-block white-text">
                There are no members to show at the moment. Please come back later;
            </div>
        </c:if>

        <div class="profile-list">

            <c:forEach items="${members}" var="member">
                <div class="profile-block animated fadeIn">
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="profile-admin-bar">
                            <div class="ripieno-button"
                                 onclick="editMember(${member.getId()},
                                         $('#member-name${member.getId()}').text(),
                                         $('#member-title${member.getId()}').text(),
                                         $('#member-description${member.getId()}').html(),
                                         '${member.getProfilePic()}',
                                         '${member.getFacebook()}',
                                         '${member.getTwitter()}',
                                         '${member.getInstagram()}');">
                                Edit
                            </div>
                            <div class="ripieno-button"
                                 onclick="confirmDelete(${member.getId()}, $('#member-name${member.getId()}').text())">
                                Delete
                            </div>
                        </div>
                    </sec:authorize>
                    <div class="profile-columns">
                        <div class="profile-bar">
                            <div class="profile-pic animated fadeIn">
                                <img class="materialboxed"
                                     src="${not empty member.getProfilePic()? member.getProfilePic() : '/resources/jpg/profile-nopic.jpg'}"/>
                            </div>
                            <div class="profile-social-media-bar" style="display: flex">
                                <c:if test="${not empty member.getFacebook()}">
                                    <a class="profile-social-btn" href="${member.getFacebook()}" target="_blank"><i
                                            class="fa fa-facebook fa-2x white-text"></i></a>
                                </c:if>
                                <c:if test="${not empty member.getTwitter()}">
                                    <a class="profile-social-btn" href="${member.getTwitter()}" target="_blank"><i
                                            class="fa fa-twitter fa-2x white-text"></i></a>
                                </c:if>
                                <c:if test="${not empty member.getInstagram()}">
                                    <a class="profile-social-btn" href="${member.getInstagram()}" target="_blank"><i
                                            class="fa fa-instagram fa-2x white-text"></i></a>
                                </c:if>

                            </div>
                        </div>
                        <div class="profile-desc">
                            <div id="member-name${member.getId()}" class="profile-name white-text">
                                    ${member.getName()}
                            </div>
                            <div id="member-title${member.getId()}" class="profile-subheader grey-text">
                                    ${member.getTitle()}
                            </div>
                            <div id="member-description${member.getId()}" class="profile-text white-text">
                                    ${member.getDescription()}
                            </div>
                            <div style="display:flex">
                                <div class="ripieno-button">More</div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>

<%@ include file="templates/footer.jspf" %>
</body>

</html>