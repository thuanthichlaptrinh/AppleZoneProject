<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>AppleZone</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link href="<c:url value='/assets/user/css/index.css'/>" rel="stylesheet" />  
        <decorator:head />
        <style>
        	.custom-hover-blue {
			    display: inline-block;
			    padding-left: 3rem;  
			    padding-right: 3rem;
			    padding-top: 0.375rem; 
			    padding-bottom: 0.375rem;
			    border: 1px solid #3b82f6; 
			    color: #3b82f6; 
			    border-radius: 0.375rem; 
			    text-decoration: none;
			}
			
			.custom-hover-blue:hover {
			    background-color: #3b82f6;  
			    color: white;  
			}	
        </style>
    </head>
    <body class="bg-gray-100">
        <!-- Header -->
        <%@include file="/WEB-INF/views/layouts/user/header.jsp" %> 
        
        <!-- Content -->
		<decorator:body  />
		
		<!-- Footer -->
		<%@include file="/WEB-INF/views/layouts/user/footer.jsp" %> 

        
        <script src="<c:url value='/assets/user/js/main.js'/>"></script>
        <script src='<c:url value='/assets/user/js/detail.js'></c:url>'></script>
        <decorator:getProperty property="page.script" />
    </body>
</html>
