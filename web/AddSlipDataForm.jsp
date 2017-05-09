<%--
  Created by IntelliJ IDEA.
  User: pradh
  Date: 5/7/2017
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Slip Number</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<link href="css/styles.css" type="text/css">
<body>

<form action="AddSlipDataForm.jsp" method="get">
    <div class="row">
        <div class="input-field col s6">
            <input placeholder="Placeholder" id="first_name" type="text" class="validate">
            <label for="first_name">First Name</label>
        </div>
    </div>
    <%
        for (int i = 1; i <= 18; i++) {
    %>
    <div class="row">
        <div class="col s4"><p>
            <input name="SlipData" type="checkbox" id="<%=Integer.toString(i)%>>"/>
            <label for="<%=Integer.toString(i)%>">#<%=i%>%></label>
        </p></div>
        <div class="col s4"><p>
            <input name="SlipData" type="checkbox" id="<%=Integer.toString(i)%>>"/>
            <label for="<%=Integer.toString(i)%>">#<%=i%>%></label>
        </p></div>
        <div class="col s4"><p>
            <input name="SlipData" type="checkbox" id="<%=Integer.toString(i)%>>"/>
            <label for="<%=Integer.toString(i)%>">#<%=i%>%></label>
        </p></div>
    </div>
    <%
        }
    %>
    <p>
        <input type="checkbox" id="test0"/>
        <label for="test0">Red</label>
    </p>
</form>
</body>
</html>
