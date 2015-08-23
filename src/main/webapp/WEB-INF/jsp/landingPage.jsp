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

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/landingpage.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/animate.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway:700' rel='stylesheet' type='text/css'>

    <script type="application/ld+json">
      {
        "@context" : "http://schema.org",
        "@type" : "Organization",
        "name" : "Ripieno Singers Inc.",
        "url" : "http://www.ripienosingers.com/",
        "sameAs" : [
          "https://www.facebook.com/pages/The-Ripieno-Singers-Inc/752278521519093?fref=ts",
          "https://twitter.com/ripienosingers",
          "https://instagram.com/theripienosingersinc/"
        ]
      }
    </script>
</head>

<body>

    <div class="centered-container">
        <div class="containeritem-subheader  animated fadeInDown"> THE </div>
        <div class="containeritem-header  animated fadeInDown"> RIPIENO SINGERS </div>
        <div class="containeritem-subheader  animated fadeInDown"> INC. </div>
        <div class="containeritem  animated fadeIn">
            <i class="fa fa-ellipsis-h fa-3x"> </i>
        </div>
        <div class="containeritem  animated fadeInUp" id="facebookButton">
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
                <a href="https://www.youtube.com/channel/UCbhMmSRV3YspiV33sbBHxvA" target="_blank">
                    <i class="fa fa-youtube fa-3x white-font"></i>
                </a>
            </div>
            <div class="round-button" id="instagramButton">
                <a href="https://instagram.com/theripienosingersinc/" target="_blank">
                    <i class="fa fa-instagram fa-3x white-font"></i>
                </a>
            </div>
        </div>

        <div class="containeritem animated fadeIn">
            <div class="entersite-button">
                <a href="home"> CONTINUE TO SITE </a>
            </div>
        </div>

    </div>

</body>

</html>