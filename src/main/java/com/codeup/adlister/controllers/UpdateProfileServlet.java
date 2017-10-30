package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/update-profile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        boolean passwordChanged = true;


        String passwordConfirmation = request.getParameter("confirmPassword");

        HashMap<String, String> errors = new HashMap<>();

        User user = (User) request.getSession().getAttribute("user");

        if (firstname.isEmpty()) {
            errors.put("firstname", "First name is required");
        }
        if (lastname.isEmpty()) {
            errors.put("lastname", "Last name is required");
        }
        if (email.isEmpty()) {
            errors.put("email", "Email is required");
        }


        if (password != null && !password.equals("")) {

            if (password.isEmpty()) {
                errors.put("password", "Password is required");
                passwordChanged = false;
            }

            if (!BCrypt.checkpw(password, user.getPassword())) {
                errors.put("currentPassword", "This is not your current password");
                passwordChanged = false;

            }

            if (!passwordConfirmation.equals(newPassword)) {
                errors.put("confirmPassword", "Passwords must match!");
                passwordChanged = false;

            }

        } else {
            passwordChanged = false;
        }


        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/update-profile.jsp").forward(request, response);
        } else {
            if (passwordChanged) {
                user.setPassword(Password.hash(newPassword));
            }
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setEmail(email);
            DaoFactory.getUsersDao().update(user);
            response.sendRedirect("/profile");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        User userDb = DaoFactory.getUsersDao().findByUsername(user.getUsername());

        if (user == null) {
            response.sendRedirect("/login");
        }
        // Passing to the view
        request.setAttribute("user", userDb);
        request.getRequestDispatcher("/WEB-INF/update-profile.jsp").forward(request, response);

    }

}
