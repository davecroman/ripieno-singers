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
       <div id="popup" class="popup-bg hide">
        <div class="popup-container">
          <form onSubmit="onSubmit()" action="/contactUs/updateSection" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" id="sectionContent" name="sectionContent">
            <input type="hidden" id="sectionId" name="sectionId">
            <div style="display:flex;margin-bottom:5px;">
              <a class="fa fa-times fa-2x" style="width:100%;text-align:right;" onclick="$('#popup').addClass('hide')"></a>
            </div>
            <div style="display:flex;background-color: rgba(255,255,255,0.2);padding-left: 10px;padding-right: 10px;">
              <input id="section-header" name="sectionName" style="color:white;font-size:20px" type="text" value="Title" required></div>
            <div>
            <%@ include file="templates/texteditor.jspf" %></div>
            <div style="display:flex;background-color:rgba(255,255,255,0.2)">
              <a href="#" class="ripieno-button2" onclick="$('#popup').addClass('hide')"> Back </a>
              <button class="ripieno-button2" type="submit"> Save </a>
            </div>
          </form>
        </div>
       </div>
       <c:if test="${not empty notifications}">
         <div class="wrap" style="width:100%;display:block;">
          <%@ include file="templates/notifications.jspf" %>
         </div>
       </c:if>
       <div class="wrap">
           <div class="left-column animated fadeIn" style="margin-right:10px">
            <div style="display:flex;">
              <h3 class="grey-text text-lighten-5" style="width:100%">
                  ${visit.getSectionName()}
              </h3>
              <sec:authorize access="hasRole('ADMIN')">
                   <div style="width: 100%;margin: auto;">
                     <a class="ripieno-button" style="float: right;" href="#" onclick="editSection('${visit.getSectionName()}', $('#visitSection'), ${visit.getId()});">
                         Edit
                     </a>
                   </div>
               </sec:authorize>
            </div>
              <div id="visitSection" class="text-block grey-text text-lighten-5">
                 ${visit.getContents()}
               </div>
               <div class="video-container responsive-video animated fadeIn">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3860.966487088723!2d121.01108231484027!3d14.600984989802273!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397c9de7e58e46d%3A0x8ef8d227ae46c96b!2s4427+Old+Sta.+Mesa+St%2C+Santa+Mesa%2C+Manila%2C+1016+Metro+Manila%2C+Philippines!5e0!3m2!1sen!2sau!4v1449389022985" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
              </div>
           </div>
           <div class="right-column animated fadeIn" style="margin-right:10px">
               <div style="display:flex;">
                    <h3 class="grey-text text-lighten-5" style="width:100%">
                       ${phone.getSectionName()}
                    </h3>
                    <sec:authorize access="hasRole('ADMIN')">
                        <div style="width: 100%;margin: auto;">
                          <a class="ripieno-button" style="float: right;" href="#" onclick="editSection('${phone.getSectionName()}', $('#phoneSection'), ${phone.getId()})">
                              Edit
                          </a>
                        </div>
                    </sec:authorize>
               </div>
               <div id="phoneSection" class="grey-text text-lighten-5 text-block">
                    ${phone.getContents()}
               </div>
               <div style="display:flex;">
                   <h3 class="grey-text text-lighten-5" style="width:100%">
                      ${email.getSectionName()}
                   </h3>
                   <sec:authorize access="hasRole('ADMIN')">
                       <div style="width: 100%;margin: auto;">
                         <a class="ripieno-button" style="float: right;" href="#" onclick="editSection('${email.getSectionName()}', $('#emailSection'), ${email.getId()})">
                             Edit
                         </a>
                       </div>
                   </sec:authorize>
               </div>
              <div id="emailSection" class="grey-text text-lighten-5 text-block">
                   ${email.getContents()}
              </div>
              <div style="display:flex;">
                <h3 class="grey-text text-lighten-5" style="width:100%">
                    ${connect.getSectionName()}
                </h3>
                <%--
                <sec:authorize access="hasRole('ADMIN')">
                     <div style="width: 100%;margin: auto;">
                       <a class="ripieno-button" style="float: right;" href="#" onclick="editSection('${connect.getSectionName()}', $('#connectSection'))">
                           Edit
                       </a>
                     </div>
                 </sec:authorize>
                 --%>
               </div>
               <div class="text-block">
                 <div id="connectSection">
                   ${connect.getContents()}
                 </div>
               </div>

           </div>
       </div>
       <script>
          function editSection(sectionName, sectionContent, sectionId){
            $('#popup').removeClass('hide');
            $('#section-header').val(sectionName);
            $('#sectionId').val(sectionId);
            editor.setHTML(sectionContent.html());
          }

          function onSubmit(){
            $('#sectionContent').val(editor.getHTML());
          }

       </script>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>