<%-- 
    Document   : tester
    Created on : Mar 6, 2022, 11:02:14 PM
    Author     : duyta
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List,com.fptuni.prj301.demo.model.Product" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
        
        <h1>Product List</h1>
        <table>
            <c:set car="row" value="0"/>
            
            <c:forEach var="product" items="${ss.list}">
                
                <h1>
                    ${product.productID}
                </h1>
                
            </c:forEach>
        </table>
        
    </body>
</html>
