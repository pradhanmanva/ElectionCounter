<%--
  Created by IntelliJ IDEA.
  User: pradh
  Date: 5/3/2017
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Connecting.*" %>
<%@page import="Beans.*" %>
<%
    jdbcClass object = new jdbcClass();
    CandidateClass[] candidateClasses = object.SelectStatement();
%>
<html>
<head>
    <title>Election Counting</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<body>
<div class="container">
    <div id="space_top6"></div>
    <div class="row">
        <div class="col s6"><a class="btn-floating btn-large waves-effect waves-light teal" href="AddSlipData.jsp">
            <i class="material-icons">add</i></a> Add Slip Data
        </div>

        <div class="col s6"><a class="btn-floating btn-large waves-effect waves-light teal" href="CheckSlipData.jsp">
            <i class="material-icons">done</i></a> Check Slip Data
        </div>
    </div>
    <div class="card teal lighten-4">
        <div class="row">
            <div class="col s12">
                <table id="voterTable">
                    <tr>
                        <th>Number#</th>
                        <th>Name</th>
                        <th>Votes</th>
                        <th>Panel</th>
                    </tr>
                    <%
                        for (CandidateClass x : candidateClasses) {
                    %>
                    <tr>
                        <td><%=x.getId()%>
                        </td>
                        <td><%=x.getName()%>
                        </td>
                        <td><%=x.getVotes()%>
                        </td>
                        <td><%=x.getPanel()%>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>