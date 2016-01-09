<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. " />
    <meta name="google-site-verification" content="cBXIsWG0vhyyiyczVdBHt4JMlupNobtQMxkJS68K3Io" />
    <meta property="og:title" content="The Ripieno Singers" />
    <meta property="og:description" content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. " />
    <meta property="og:image" content="https://ripienosingers.herokuapp.com/resources/jpg/welcomebg.jpg" />
    <meta property="og:type" content="website" />
    <meta property="fb:app_id" content="1659655334305089" />

    <title>The Ripieno Singers</title>

    <link rel="shortcut icon" href="/ripienoicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/landingpage.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/animate.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway:700' rel='stylesheet' type='text/css'>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js"></script>

    <script type="application/ld+json">
      {
        "@context" : "http://schema.org",
        "@type" : "Organization",
        "name" : "Ripieno Singers Inc.",
        "url" : "http://www.ripienosingers.com/",
        "sameAs" : [
          "https://www.facebook.com/pages/The-Ripieno-Singers-Inc/752278521519093?fref=ts",
          "https://twitter.com/dripienosingers",
          "https://instagram.com/theripienosingersinc/"
        ]
      }
    </script>
</head>

<body>

    <div class="centered-container hide-on-small-only">
        <div class="containeritem-subheader animated fadeInDown"> THE </div>
        <div class="containeritem-header  animated fadeInDown"> RIPIENO SINGERS </div>
        <div class="containeritem-subheader  animated fadeInDown"> INC. </div>
        <div class="containeritem  animated fadeIn">
            <i class="fa fa-ellipsis-h fa-3x"> </i>
        </div>
        <div class="containeritem  animated fadeInUp" id="facebookButton">
            <div class="round-button">
                <a href="https://www.facebook.com/pages/The-Ripieno-Singers-Inc/752278521519093?fref=ts" target="_blank">
                    <i class="fa fa-facebook fa-3x white-text"></i>
                </a>
            </div>
            <div class="round-button" id="twitterButton">
                <a href="https://twitter.com/dripienosingers" target="_blank">
                    <i class="fa fa-twitter fa-3x white-text"></i>
                </a>
            </div>
            <div class="round-button" id="youtubeButton">
                <a href="https://www.youtube.com/channel/UCbhMmSRV3YspiV33sbBHxvA" target="_blank">
                    <i class="fa fa-youtube fa-3x white-text"></i>
                </a>
            </div>
            <div class="round-button" id="instagramButton">
                <a href="https://instagram.com/theripienosingersinc/" target="_blank">
                    <i class="fa fa-instagram fa-3x white-text"></i>
                </a>
            </div>
        </div>

        <div class="containeritem animated fadeIn">
            <div class="entersite-button">
                <a href="home" class="white-text"> CONTINUE TO SITE </a>
            </div>
        </div>

    </div>

</body>

<script>
    if (window.outerWidth < 600){
        window.location.replace("http://www.ripienosingers.com/home")
    }

</script>

</html>