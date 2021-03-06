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

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hash = Password.hash(password);
        String passwordConfirmation = request.getParameter("confirm_password");

        if (DaoFactory.getUsersDao().findByUsername(username) != null) {
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("error", username + " Username is already taken, please try another");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }


        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        HashMap<String, String> Errors = new HashMap<>();
        if (firstname.isEmpty()) {
            Errors.put("firstname", "<div class='alert alert-danger'>Please enter first name</div>");
        }else{
            request.setAttribute("firstname", firstname);
        }
        if (lastname.isEmpty()) {
            Errors.put("lastname", "<div class='alert alert-danger'>Please enter last name</div>");
        }else{
            request.setAttribute("lastname", lastname);
        }
        if (username.isEmpty()) {
            Errors.put("username", "<div class='alert alert-danger'>Please enter username</div>");
        }else{
            request.setAttribute("username", username);
        }
        if (email.isEmpty()) {
            Errors.put("email", "<div class='alert alert-danger'>Please enter email</div>");
        }else{
            request.setAttribute("email", email);
        }
        if (password.isEmpty()) {
            Errors.put("password", "<div class='alert alert-danger'>Please enter password</div>");
        }
        if (!passwordConfirmation.equals(password)) {
            Errors.put("confirm_password", "<div class='alert alert-danger'>Passwords must match</div>");
        }

        request.setAttribute("Errors", Errors);


        if (inputHasErrors) {
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create and save a new user
        User user = new User(firstname, lastname, username, email, hash);
        Long id = DaoFactory.getUsersDao().insert(user);
        user.setId(id);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");
    }
}
