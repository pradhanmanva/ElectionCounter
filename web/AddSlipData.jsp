<%--
  Created by IntelliJ IDEA.
  User: pradh
  Date: 5/9/2017
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Connecting.*" %>
<%
    try {
        String[] votes = request.getParameterValues("SlipData");
        int id = Integer.parseInt(request.getParameter("slipNumber"));
        int[] values = new int[18];
        jdbcSlipData jdbcSlipData = new jdbcSlipData();
        boolean result;
        int j = 0;
        int temp = 0;
        for (int i = 0; j < votes.length; i++) {
            System.out.println(votes[j]);
            try {
                temp = Integer.parseInt(votes[j]);
            } catch (ArrayIndexOutOfBoundsException ar) {
                ar.printStackTrace();
            }
            if (temp == i + 1) {
                values[i] = 1;
                j++;
            } else {
                values[i] = 0;
            }
        }
        result = jdbcSlipData.addSlipData(id, values);
        System.out.println(result);
        request.getRequestDispatcher("AddSlipDataForm.jsp").forward(request, response);
    } catch (NullPointerException e) {
        request.getRequestDispatcher("AddSlipForm.jsp").forward(request, response);
        e.printStackTrace();
    } catch (Exception e) {
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        e.printStackTrace();
    }
%>