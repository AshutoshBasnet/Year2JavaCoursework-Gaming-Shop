<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>

<link rel="stylesheet" href="${contextPath}/css/register.css">
</head>

<body>

<div class="container">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <h1>Create your<br>account</h1>
        <div class="circle"></div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <!-- LOGO -->
        <div class="logo-container">
            <img src="${contextPath}/resources/logo/logo.png" alt="Logo">
        </div>

        <!-- Messages -->
        <c:if test="${not empty error}">
            <div class="message error">${error}</div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="message success">${success}</div>
        </c:if>

        <form id="registerForm" action="${contextPath}/register" method="post" enctype="multipart/form-data">

            <!-- PROFILE UPLOAD -->
            <div class="profile-upload">
                <label for="profilePic">
                    <img id="preview" src="${contextPath}/resources/logo/logo.png">
                    <span>Upload Photo</span>
                </label>
                <input type="file" id="profilePic" name="image" accept="image/*">
            </div>

            <!-- FORM -->
            <div class="form-row">
                <input name="firstName" placeholder="First Name" value="${firstName}" required>
                <input name="lastName" placeholder="Last Name" value="${lastName}" required>
            </div>

            <div class="form-row">
                <input name="username" placeholder="Username" value="${username}" required>
                <input type="date" name="dob" value="${dob}" required>
            </div>

            <div class="form-row">
                <select name="gender" required>
                    <option value="">Gender</option>
                    <option value="male" ${gender == 'male' ? 'selected' : ''}>Male</option>
                    <option value="female" ${gender == 'female' ? 'selected' : ''}>Female</option>
                </select>

                <input type="email" name="email" placeholder="Email" value="${email}" required>
            </div>

            <div class="form-row">
                <input type="tel" name="phoneNumber" placeholder="Phone" value="${phoneNumber}" required>

                <select name="address" required>
                    <option value="">Address</option>
                    <option value="Kathmandu" ${address == 'Kathmandu' ? 'selected' : ''}>Kathmandu</option>
                    <option value="Lalitpur" ${address == 'Lalitpur' ? 'selected' : ''}>Lalitpur</option>
                    <option value="Bhaktapur" ${address == 'Bhaktapur' ? 'selected' : ''}>Bhaktapur</option>
                </select>
            </div>

            <div class="form-row">
                <input type="password" id="password" name="password" placeholder="Password" required>
                <input type="password" id="confirmPassword" name="retypePassword" placeholder="Confirm Password" required>
            </div>

            <button type="submit">SIGNUP</button>

            <div class="footer">
                Already have an account?
                <a href="${contextPath}/login">Login</a>
            </div>

        </form>

    </div>
</div>

<script src="${contextPath}/js/register.js"></script>

</body>
</html>