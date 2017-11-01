package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

import static java.lang.System.out;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = DaoFactory.getUsersDao().findByUsername(username);

        HashMap<String, String> Errors = new HashMap<>();


        boolean loginHasIssues = username.isEmpty() || password.isEmpty();

        if (username.isEmpty()) {
            Errors.put("username", "Please enter a valid username");
        }else{
            request.setAttribute("username", username);
        }
        if (password.isEmpty()) {
            Errors.put("password", "Please enter a correct password");
        }

        request.setAttribute("Errors", Errors);

        if (loginHasIssues) {
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

        if (user == null) {

             Errors.put("username", "Credentials did not match");
        request.setAttribute("Errors", Errors);


        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        boolean validAttempt = Password.check(password, user.getPassword());

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        } else {

            Errors.put("password", "Credentials did not match");
            request.setAttribute("Errors", Errors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

    }
}
