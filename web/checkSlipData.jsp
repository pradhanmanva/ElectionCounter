<%--
  Created by IntelliJ IDEA.
  User: pradh
  Date: 5/9/2017
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Connecting.*" %>
<%@page import="Beans.*" %>

<%
    try {
        String slipNumber = request.getParameter("slip_number");
        if (slipNumber != null) {
            int id = Integer.parseInt(slipNumber);
            jdbcSlipData slipDataClass = new jdbcSlipData();
            SlipData slipData = slipDataClass.showSlipData(id);
            request.setAttribute("slipdata", slipData);
        }
        request.getRequestDispatcher("CheckSlipDataForm.jsp").forward(request, response);
    } catch (Exception e) {
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        System.out.println(e.getMessage());
        e.printStackTrace();
    }
%>
