<%@ include file="templates/tags.jspf" %>

<!doctype html>
<html>
<head>
    <%@ include file="templates/head.jspf" %>
</head>

<body>
    <%@ include file="templates/header.jspf" %>

    <c:if  test="${!empty peopleList}">
          <h3>People</h3>
          <table class="table table-bordered table-striped">
              <thead>
              <tr>
                  <th>Name</th>
                  <th>&nbsp;</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${peopleList}" var="person">
                  <tr>
                      <td>${person.lastName}, ${person.firstName}</td>
                      <td><form action="delete/${person.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Delete"/></form></td>
                  </tr>
              </c:forEach>
              </tbody>
          </table>
      </c:if>

    <%@ include file="templates/footer.jspf" %>
</body>

<%@ include file="templates/script.jspf" %>

</html>