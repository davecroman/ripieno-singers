<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <title>The Ripieno Singers - Contact Us</title>
    <%@ include file="templates/head.jspf" %>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
       <div class="wrap">
           <div class="left-column with-margin-left-right animated fadeIn">
            <h3 class="grey-text text-lighten-5">
                Visit Us
            </h3>
              <div class="text-block">
                 ${visit.getContents()}
                 <div class="video-container responsive-video animated fadeIn">
                   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3860.966487088723!2d121.01108231484027!3d14.600984989802273!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397c9de7e58e46d%3A0x8ef8d227ae46c96b!2s4427+Old+Sta.+Mesa+St%2C+Santa+Mesa%2C+Manila%2C+1016+Metro+Manila%2C+Philippines!5e0!3m2!1sen!2sau!4v1449389022985" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                 </div>
               </div>
           </div>
           <div class="right-column with-margin-left-right animated fadeIn">
               <div>
                    <h3 class="grey-text text-lighten-5">
                       Phone
                    </h3>
               </div>
               <div class="grey-text text-lighten-5 text-block">
                    ${phone.getContents()}
               </div>
               <div class="grey-text text-lighten-5">
                   <h3 class="grey-text text-lighten-5">
                      Email
                   </h3>
               </div>
              <div class="grey-text text-lighten-5 text-block">
                   ${email.getContents()}
              </div>
              <div>
                <h3 class="grey-text text-lighten-5">
                    Connect
                </h3>
               </div>
               <div>
                 ${connect.getContents()}
               </div>

           </div>
       </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>