<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<link rel="stylesheet" href="${contextPath}/css/login.css">
</head>

<body>

<div class="container">

    <div class="card">

        <p class="subtitle">Please enter your details</p>
        <h1>Welcome back</h1>

        <!-- LOGO -->
        <div class="logo">
            <img src="${contextPath}/resources/logo/logo.png" alt="Logo">
        </div>

        <!-- Messages -->
        <c:if test="${not empty error}">
            <div class="message error">${error}</div>
        </c:if>

        <form action="${contextPath}/login" method="post">

            <input type="text" name="username" placeholder="Username" required>

            <input type="password" name="password" placeholder="Password" required>

            <div class="remember">
                <input type="checkbox" name="remember">
                <label>Remember for 30 days</label>
            </div>

            <button type="submit">SIGN IN</button>

        </form>

    </div>

</div>

<script src="${contextPath}/js/login.js"></script>

</body>
</html>