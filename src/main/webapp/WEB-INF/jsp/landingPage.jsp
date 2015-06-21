<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>The Ripieno Singers</title>

    <link rel="stylesheet" href="/resources/css/landingpage.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway:700' rel='stylesheet' type='text/css'>
</head>

<body>

    <div class="main-container">
        <div class="containeritem-subheader"> THE </div>
        <div class="containeritem-header"> RIPIENO SINGERS </div>
        <div class="containeritem-subheader"> INC. </div>
        <div class="containeritem">
            <i class="fa fa-ellipsis-h fa-3x"> </i>
        </div>
        <div class="containeritem" id="facebookButton">
            <div class="round-button">
                <a href="https://www.facebook.com/pages/The-Ripieno-Singers-Inc/752278521519093?fref=ts" target="_blank">
                    <i class="fa fa-facebook fa-3x white-font"></i>
                </a>
            </div>
            <div class="round-button" id="twitterButton">
                <a href="https://twitter.com/ripienosingers" target="_blank">
                    <i class="fa fa-twitter fa-3x white-font"></i>
                </a>
            </div>
            <div class="round-button" id="youtubeButton">
                <i class="fa fa-youtube fa-3x white-font"></i>
            </div>
            <div class="round-button" id="instagramButton">
                <a href="https://instagram.com/theripienosingersinc/" target="_blank">
                    <i class="fa fa-instagram fa-3x white-font"></i>
                </a>
            </div>
        </div>
        <div class="containeritem entersite-button">
            <p> WE ARE COMING SOON </p>
        </div>

    </div>

</body>

</html>