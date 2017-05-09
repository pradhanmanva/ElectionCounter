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
<div class="container">
    <div class="row" id="space_top"></div>
    <div class="row" id="space_top1"></div>
    <div class="card teal lighten-4">
        <form action="AddSlipDataForm.jsp" method="get">
            <div class="row" id="space_top2"></div>
            <div class="row">
                <div class="col s2"><a class="btn-floating btn-large waves-effect waves-light teal" href="index.jsp">
                    <i class="material-icons">fast_rewind</i></a></div>
                <div class="input-field col s4">
                    <input id="slipNumber" type="number" class="validate">
                    <label for="slipNumber">Slip Number</label>
                </div>
                <div class="col s4">
                    <button type="submit" class="waves-effect waves-light btn teal">
                        <i class="material-icons left">play_arrow</i>Add Data
                    </button>
                </div>
            </div>
            <%

                for (int j = 1, i = 1; i <= 6; i++, j = j + 3) {
            %>
            <div class="row">
                <div class="col s2"></div>
                <div class="col s2"><p>
                    <input name="SlipData" type="checkbox" id="<%=Integer.toString(j)%>"/>
                    <label for="<%=Integer.toString(j)%>">#<%=j%>
                    </label>
                </p></div>
                <div class="col s1"></div>
                <div class="col s2"><p>
                    <input name="SlipData" type="checkbox" id="<%=Integer.toString(j+1)%>"/>
                    <label for="<%=Integer.toString(j+1)%>">#<%=j + 1%>
                    </label>
                </p></div>
                <div class="col s1"></div>
                <div class="col s2"><p>
                    <input name="SlipData" type="checkbox" id="<%=Integer.toString(j+2)%>"/>
                    <label for="<%=Integer.toString(j+2)%>">#<%=j + 2%>
                    </label>
                </p></div>
                <div class="col s2"></div>
            </div>
            <%
                }
            %>

        </form>
    </div>
</div>
</body>
</html>
