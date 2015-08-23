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
    <link rel="stylesheet" href="/resources/css/navigator.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/animate.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/home.css" type="text/css"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway:700' rel='stylesheet' type='text/css'>

    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <!-- Compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js"></script>
</head>

<body>
    <%@ include file="header.jspf" %>

    <main>
        <div class="slider">
            <ul class="slides">
              <li>
                <img src="/resources/slider/1.png">
                <div class="caption left-align bottomized shadowed-text">
                  <h3>With Sir Mark Carpio</h3>
                  <h5 class="light white-text">The chorale with Sir Mark Carpio, the choir master of the world renowned Philippine Madrigal Singers</h5>
                </div>
              </li>

              <li>
                <img src="/resources/slider/2.png">
                <div class="caption left-align bottomized shadowed-text">
                  <h3>News To Go</h3>
                  <h5 class="light white-text">The group with Ms. Kara David and Mr. Howie Severino of GMA News' News To Go after being featured and interviewed in their segment</h5>
                </div>
              </li>
              <li>
                  <img src="/resources/slider/3.png">
                  <div class="caption left-align bottomized shadowed-text">
                    <h3>With Ms. Jessica Soho</h3>
                    <h5 class="light white-text">A photo opportunity with Ms. Jessica Soho featuring PUPLHS Chorale in Kapuso Mo, Jessica Soho.</h5>
                  </div>
              </li>
              <li>
                <img src="/resources/slider/4.png">
                <div class="caption left-align bottomized shadowed-text">
                  <h3>With Ms. Lani Misalucha</h3>
                  <h5 class="light white-text">A photo taken with the Asia's Nightingale, Lani Misalucha, after shooting a clip for GMA News' show Follow That Star</h5>
                </div>
              </li>
              <li>
                  <img src="/resources/slider/5.png">
                  <div class="caption right-align shadowed-text">
                    <h3>Unang Hirit Guesting</h3>
                    <h5 class="light white-text">Unang Hirit guesting of PUPLHS Chorale with its lovely hosts Lhar Santiago, Lyn Ching-Pascual, Arnold Clavio, and Rhea Santos</h5>
                  </div>
              </li>
              <li>
                <img src="/resources/slider/6.png">
                <div class="caption left-align bottomized shadowed-text">
                  <h3>Unang Hirit Guesting</h3>
                  <h5 class="light white-text">TV guesting of the PUPLHS Chorale in Unang Hirit after winning a Gold diploma and placing second in Mixed Youth Choir Category from the 1st Vietnam International Choir Festival and Competition held in Hoi An, Quang Nam, Vietnam</h5>
                </div>
              </li>
            </ul>
        </div>
        <div class="wrap">
            <div class="left-column">
                <div class="subheader">
                    Services Offered
                </div>
                <p class="with-margin-left-right animated fadeIn">
                    As a choral group, The Ripieno Singers performs and entertains in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. Solo, Duo and Small group performances will surely showcase the group's exceptional talents in a variety of events to capture the hearts of the listeners.Invite us to perform on your events and be enchanted with our God given talents!
                </p>

                <div class="subheader">
                    Did you know?
                </div>
                <p class="with-margin-left-right animated fadeIn">
                    Ephraim Gianan is the only member able to attend all major competitions joined by the group here (Davao) and abroad (Malaysia, Vietnam, Guam).
                </p>
            </div>

            <div class="right-column">
                <div class="header">
                    The Ripieno <br> Singers Inc
                </div>
                <p class="with-margin-left-right animated fadeIn">
                    The Ripieno Singers is a newly founded group in 2014 that aims to continuously stretch God's love through choral singing. Following its roots, all of its members are students and graduates of Polytechnic University of the Philippines Laboratory High School and were members of PUPLHS Chorale. Many of them are now enrolled in different universities around Metro Manila and some of them are now working as professionals. Because of its unique way of connecting to people through their music, Mr. Jarin after resigning from his post as the conductor of PUPLHS Chorale in 2014 together with his members, decided to create the “The Ripieno Singers Inc.” to keep their friendships, to continue their passion and commitment to God in sharing and inspiring other people through singing.
                </p>

                <div style="video-container responsive-video text-align:center">
                    <iframe width="490" height="281" src="https://www.youtube.com/embed/yEA6uogFc9c?controls=0&showinfo=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jspf" %>
</body>

<script>
    (function($){
      $(function(){

       // The rest above this is hidden

       $('.slider').slider();

      }); // end of document ready
    })(jQuery); // end of jQuery name space
</script>
</html>