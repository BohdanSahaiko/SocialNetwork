<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                User Details
            </h3>
        </div>
        <div class="panel-body">
            <form:form id="booksRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post" action="saveUser">
                <th><a href="deleteUsers?id=<c:out value='${users.id}'/>">Delete</a></th>
                <div class="form-group">
                    <div class="control-label col-xs-3"> <form:label path="name" >${userObject.name}</form:label> </div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${userObject.id}"/>
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="surname" cssClass="control-label col-xs-3">${userObject.surname}</form:label>
                </div>
                <div class="form-group">
                    <form:label path="info" cssClass="control-label col-xs-3">${userObject.info}</form:label>
                </div>

                <div class="form-group">
                    <form:label path="avatar" cssClass="control-label col-xs-3"><img src="data:image/jpeg;base64,${userObject.getImgAsBase64()}"></form:label>
                </div>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <div class="add-button">
                        <a class="add-button-link" href="editUser">edit</a>
                    </div>
                    <div class="add-button">
                        <a class="add-button-link" href="/event/createEvent">event</a>
                    </div>
                    <div class="add-button">
                        <a class="add-button-link" href="/friends">friends</a>
                    </div>
                    <div class="add-button">
                        <a class="add-button-link" href="/allPeople">allPeople</a>
                    </div>
                    <div class="add-button">
                        <a class="add-button-link" href="/event/myEvents">MyEvents</a>
                    </div>
                </sec:authorize>
            </form:form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

</body>
</html>