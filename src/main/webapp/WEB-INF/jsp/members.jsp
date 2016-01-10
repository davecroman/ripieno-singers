<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - Members</title>
    <%@ include file="templates/head.jspf" %>
    <link rel="stylesheet" type="text/css" href="/resources/css/members.css"/>
</head>

<body>
<%@ include file="templates/header.jspf" %>

<main>
    <div class="header grey-text text-lighten-5 animated fadeIn" style="margin: 15px;">
        The Ripieno Singers Inc.
    </div>
    <%@ include file="templates/memberEditor.jspf" %>
    <div class="wrap" style="display:block">
        <sec:authorize access="hasRole('ADMIN')">
            <div class="row center">
                <a class="ripieno-button">
                    <i class="fa fa-plus"></i> Add Member
                </a>
            </div>
        </sec:authorize>
        <div class="profile-list">

            <div class="profile-block">
                <%--<div class="profile-admin-bar">--%>
                <%--<div class="ripieno-button" onclick="editSection(1, $('#member-name').text(), $('#member-title').text(), $('#member-description').html(), '', '', '', '', '');">Edit</div>--%>
                <%--<div class="ripieno-button">Delete</div>--%>
                <%--</div>--%>
                <div class="profile-columns">
                    <div class="profile-bar">
                        <div class="profile-pic">
                            <img style="width:100%"
                                 src="https://static.pexels.com/photos/2281/man-person-suit-united-states-of-america.jpg"/>
                        </div>
                        <div class="profile-social-media-bar" style="display: flex">
                            <a class="profile-social-btn" href=""><i class="fa fa-facebook fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-twitter fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-instagram fa-2x white-text"></i></a>
                        </div>
                    </div>
                    <div class="profile-desc">
                        <div id="member-name" class="profile-name white-text">
                            Juan dela Cruz
                        </div>
                        <div id="member-title" class="profile-subheader grey-text">
                            Tenor
                        </div>
                        <div id="member-description" class="profile-text white-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat.
                        </div>
                        <div style="display:flex">
                            <div class="ripieno-button">More</div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="profile-block">
                <div class="profile-columns">
                    <div class="profile-bar">
                        <div class="profile-pic">
                            <img style="width:100%"
                                 src="http://www.tvchoicemagazine.co.uk/sites/default/files/imagecache/interview_image/intex/michael_emerson.png"/>
                        </div>
                        <div class="profile-social-media-bar" style="display: flex">
                            <a class="profile-social-btn" href=""><i class="fa fa-facebook fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-twitter fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-instagram fa-2x white-text"></i></a>
                        </div>
                    </div>
                    <div class="profile-desc">
                        <div class="profile-name white-text">
                            Juan dela Cruz
                        </div>
                        <div class="profile-subheader grey-text">
                            Tenor
                        </div>
                        <div class="profile-text white-text">
                            Polytechnic University of the Philippines
                        </div>
                    </div>
                </div>
            </div>
            <div class="profile-block">
                <div class="profile-columns">
                    <div class="profile-bar">
                        <div class="profile-pic">
                            <img style="width:100%"
                                 src="http://blog.ramboll.com/fehmarnbelt/wp-content/themes/ramboll2/images/profile-img.jpg"/>
                        </div>
                        <div class="profile-social-media-bar" style="display: flex">
                            <a class="profile-social-btn" href=""><i class="fa fa-facebook fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-twitter fa-2x white-text"></i></a>
                            <a class="profile-social-btn" href=""><i class="fa fa-instagram fa-2x white-text"></i></a>
                        </div>
                    </div>
                    <div class="profile-desc">
                        <div class="profile-name white-text">
                            Juan dela Cruz
                        </div>
                        <div class="profile-subheader grey-text">
                            Tenor
                        </div>
                        <div class="profile-text white-text">
                            Polytechnic University of the Philippines
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="templates/footer.jspf" %>
</body>

</html>