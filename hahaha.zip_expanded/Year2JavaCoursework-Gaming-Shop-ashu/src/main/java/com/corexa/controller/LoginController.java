package com.corexa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.corexa.util.*;
import com.corexa.model.*;
import com.corexa.service.*;
/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final LoginService loginService;

    public LoginController() {
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(RedirectionUtil.loginUrl).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserModel userModel = loginService.loginUser(username, password);

        if (userModel != null) {
            // Set session attributes
            SessionUtil.setAttribute(req, "username", userModel.getUserName());
            SessionUtil.setAttribute(req, "id", userModel.getId());
            SessionUtil.setAttribute(req, "user", userModel);
            SessionUtil.setAttribute(req, "role", userModel.getUserRole());

            // Optional: also set a cookie (for UI display, NOT auth)
            CookieUtil.addCookie(resp, "role", userModel.getUserRole(), 30 * 60); // 30 min

            // Redirect based on role
            if ("admin".equals(userModel.getUserRole())) {
                resp.sendRedirect(req.getContextPath() + "/adminDashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            handleLoginFailure(req, resp);
        }
    }

    private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String errorMessage = "User credential mismatch. Please try again!";
        req.setAttribute("error", errorMessage);
        req.getRequestDispatcher(RedirectionUtil.loginUrl).forward(req, resp);
    }
}
