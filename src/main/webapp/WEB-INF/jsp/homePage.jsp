<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers</title>
    <%@ include file="templates/head.jspf" %>

    <meta property="og:title" content="The Ripieno Singers" />
    <meta property="og:description" content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. " />
    <meta property="description" content="The Official Website of The Ripieno Singers Inc. We perform and entertain in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. " />
    <meta property="og:image" content="https://ripienosingers.herokuapp.com/resources/jpg/welcomebg.jpg" />
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
        <div class="center-align animated fadeIn">
          <img src="/resources/png/logo_white.png" height="200px">
        </div>
        <div class="wrap">
            <div class="left-column">
                <div class="slider">
                    <ul class="slides">
                      <li>
                        <img src="/resources/slider/1.png">
                        <div class="caption left-align bottomized shadowed-text">
                          <h5>With Sir Mark Carpio</h5>
                          <p class="light white-text">The chorale with Sir Mark Carpio, the choir master of the world renowned Philippine Madrigal Singers</p>
                        </div>
                      </li>

                      <li>
                        <img src="/resources/slider/2.png">
                        <div class="caption left-align bottomized shadowed-text">
                          <h5>News To Go</h5>
                          <p class="light white-text">The group with Ms. Kara David and Mr. Howie Severino of GMA News' News To Go after being featured and interviewed in their segment</p>
                        </div>
                      </li>
                      <li>
                          <img src="/resources/slider/3.png">
                          <div class="caption left-align bottomized shadowed-text">
                            <h5>With Ms. Jessica Soho</h5>
                            <p class="light white-text">A photo opportunity with Ms. Jessica Soho featuring PUPLHS Chorale in Kapuso Mo, Jessica Soho.</p>
                          </div>
                      </li>
                      <li>
                        <img src="/resources/slider/4.png">
                        <div class="caption left-align bottomized shadowed-text">
                          <h5>With Ms. Lani Misalucha</h5>
                          <p class="light white-text">A photo taken with the Asia's Nightingale, Lani Misalucha, after shooting a clip for GMA News' show Follow That Star</p>
                        </div>
                      </li>
                      <li>
                          <img src="/resources/slider/5.png">
                          <div class="caption right-align shadowed-text">
                            <h5>Unang Hirit Guesting</h5>
                            <p class="light white-text">Unang Hirit guesting of PUPLHS Chorale with its lovely hosts Lhar Santiago, Lyn Ching-Pascual, Arnold Clavio, and Rhea Santos</p>
                          </div>
                      </li>
                      <li>
                        <img src="/resources/slider/6.png">
                        <div class="caption left-align bottomized shadowed-text">
                          <h5>Unang Hirit Guesting</h5>
                          <p class="light white-text">After winning a Gold diploma and placing second in Mixed Youth Choir Category from the 1st Vietnam International Choir Festival and Competition held in Hoi An, Quang Nam, Vietnam</p>
                        </div>
                      </li>
                    </ul>
                </div>
                <div class="subheader">
                    Services Offered
                </div>
                <p class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                    As a choral group, <b class="white-text"> The Ripieno Singers </b> performs and entertains in various forms and styles of singing: classical, pop, ballad, folk and more in plentiful events and occasions such as weddings, seminars, conferences, concerts, workshops, birthdays and wakes as well. Solo, Duo and Small group performances will surely showcase the group's exceptional talents in a variety of events to capture the hearts of the listeners. <br><br> Invite us to perform on your events and be enchanted with our God given talents!
                </p>

                <div class="subheader">
                    Did you know?
                </div>
                <p class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                    <b class="white-text"> Ephraim Gianan </b> is the only member able to attend all major competitions joined by the group here (Davao) and abroad (Malaysia, Vietnam, Guam).
                </p>
            </div>

            <div class="right-column">
                <div class="header">
                    The Ripieno <br> Singers Inc.
                </div>
                <p class="with-margin-left-right animated fadeIn grey-text text-lighten-2 text-block">
                    <b class="white-text"> The Ripieno Singers </b> is a newly founded group in 2014 that aims to continuously stretch God&#39;s love through choral singing. Following its roots, all of its members are students and graduates of Polytechnic University of the Philippines Laboratory High School and were members of <a target="_blank" href="https://en.wikipedia.org/wiki/PUPLHS_Chorale"> <b> PUPLHS Chorale </b> </a>. Many of them are now enrolled in different universities around Metro Manila and some of them are now working as professionals. <br><br> Because of its unique way of connecting to people through their music, Mr. Jarin after resigning from his post as the conductor of PUPLHS Chorale in 2014 together with his members, decided to create the <b class="white-text">The Ripieno Singers Inc.</b> to keep their friendships, to continue their passion and commitment to God in sharing and inspiring other people through singing.
                </p>

                <div class="video-container responsive-video" style="text-align:center">
                    <iframe width="490" height="281" src="https://www.youtube.com/embed/yEA6uogFc9c?controls=0&showinfo=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="templates/footer.jspf" %>

    <script>
        (function($){
          $(function(){
           $('.slider').slider();
          }); // end of document ready
        })(jQuery); // end of jQuery name space
    </script>

    <%@ include file="templates/script.jspf" %>
</body>

</html>

