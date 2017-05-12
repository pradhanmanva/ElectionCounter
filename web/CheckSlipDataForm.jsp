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
    try {
        jdbcCandidate object = new jdbcCandidate();
        CandidateClass[] candidateClasses = object.selectStatement();
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
        <form method="get" action="checkSlipData.jsp">
            <div class="row" id="space_top2"></div>
            <div class="row">
                <div class="col s2"><a class="btn-floating btn-large waves-effect waves-light teal" href="index.jsp">
                    <i class="material-icons">fast_rewind</i></a></div>
                <div class="input-field col s4">
                    <input id="slip_number" type="number" class="validate" name="slip_number">
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
                        <%
                            SlipData slipData = (SlipData) request.getAttribute("slipdata");
                            int num[] = new int[18];
                            if (slipData != null) {
                                num[0] = slipData.get_1();
                                num[1] = slipData.get_2();
                                num[2] = slipData.get_3();
                                num[3] = slipData.get_4();
                                num[4] = slipData.get_5();
                                num[5] = slipData.get_6();
                                num[6] = slipData.get_7();
                                num[7] = slipData.get_8();
                                num[8] = slipData.get_9();
                                num[9] = slipData.get_10();
                                num[10] = slipData.get_11();
                                num[11] = slipData.get_12();
                                num[12] = slipData.get_13();
                                num[13] = slipData.get_14();
                                num[14] = slipData.get_15();
                                num[15] = slipData.get_16();
                                num[16] = slipData.get_17();
                                num[17] = slipData.get_18();
                            }
                        %>
                        <tr>
                            <td>Voted</td>
                            <%
                                for (int i = 0; i < 18; i++) {
                            %>
                            <td>
                                <%=num[i]%>
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
<%
    } catch (Exception e) {
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        System.out.println(e.getMessage());
        e.printStackTrace();
    }
%>