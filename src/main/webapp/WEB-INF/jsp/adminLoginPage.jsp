<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <%@ include file="templates/head.jspf" %>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <main>
      <div class="col s12 max-width-500" style="margin:auto;margin-top:25px">
        <div class="row">
          <div class="col s12 center">
            <i class="fa fa-lock fa-5x white-text"></i>
          </div>
        </div>
        <div class="row">
          <div class="col s12 center">
            <p class="flow-text"> Login as Admin </p>
          </div>
        </div>

        <form action="login" method="post">
          <div class="row">
            <c:if test="${param.error != null}">
                <p class="red-text text-lighten-3">
                  Invalid username and password.
                </p>
              </c:if>
              <c:if test="${param.logout != null}">
                <p class="green-text text-lighten-3">
                  You have been logged out.
                </p>
            </c:if>
          </div>
          <div class="row">
            <div class="input-field col s12 white-text">
            <label for="username">Username</label>
            <input id="username" name="username" type="text">
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12 white-text">
              <label for="password">Password</label>
              <input id="password" name="password" type="password">
            </div>
          </div>
          <input type="hidden"
                    		name="${_csrf.parameterName}"
                    		value="${_csrf.token}"/>
          <div class="row center">
            <button class="ripieno-button" type="submit">
              Login <i class="material-icons"></i>
            </button>
          </div>
        </form>
      </div>
    </main>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>