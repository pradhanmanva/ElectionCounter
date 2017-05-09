<%--
  Created by IntelliJ IDEA.
  User: pradh
  Date: 5/7/2017
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Beans.*" %>
<%@page import="Connecting.*" %>

<%
    jdbcClass object = new jdbcClass();
    CandidateClass[] candidateClasses = object.SelectStatement();
%>
<html>
<head>
    <title>Check Slip Number</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<link href="css/styles.css" type="text/css">
<body>
<div class="container">
    <div class="row" id="space_top"></div>
    <div class="row" id="space_top1"></div>
    <div class="card teal lighten-4">
        <form>
            <div class="row" id="space_top2"></div>
            <div class="row">
                <div class="col s2"><a class="btn-floating btn-large waves-effect waves-light teal" href="index.jsp">
                    <i class="material-icons">fast_rewind</i></a></div>
                <div class="input-field col s4">
                    <input id="slip_number" type="number" class="validate">
                    <label for="slip_number">Slip Number</label>
                </div>
                <div class="col s6">
                    <button type="submit" class="waves-effect waves-light btn teal">
                        <i class="material-icons left">play_arrow</i>Show Votes
                    </button>
                </div>
            </div>
            <div class="row" id="space_top3"></div>
            <div class="row">
                <div class="col s12">
                    <table id="table_voter">
                        <tr>
                            <th>Voter#</th>
                            <%
                                for (CandidateClass x : candidateClasses) {
                            %>
                            <th>
                                <%=x.getId()%>
                            </th>
                            <%
                                }
                            %>
                        </tr>
                        <tr>
                            <td>Voted</td>
                            <%
                                for (int i = 0; i < 18; i++) {
                            %>
                            <td>
                                <%=i%>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>