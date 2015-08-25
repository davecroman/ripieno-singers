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

        <form>
          <div class="row">
            <div class="input-field col s12 white-text">
              <input placeholder="username" id="first_name" type="text" class="validate">
              <label for="username">Username</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12 white-text">
              <input placeholder="password" id="last_name" type="password" class="validate">
              <label for="password">Password</label>
            </div>
          </div>
          <div class="row center">
            <button class="ripieno-button" type="submit" name="action">
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