package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;


@WebServlet(name = "UpdateServlet", urlPatterns = "/ads/update")
public class UpdateServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            User user = (User) request.getSession().getAttribute("user");
            Long id = Long.parseLong(request.getParameter("id"));
            Ad ad = DaoFactory.getAdsDao().findById(id);
            if(ad == null || user.getId() != ad.getUserId()){
                response.sendRedirect("/index");
            }
            request.setAttribute("ad", ad);
            request.getRequestDispatcher("/WEB-INF/ads/update.jsp")
                    .forward(request, response);
        }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().findById(id);
        HashMap errors = new HashMap();

        if(user.getId() != ad.getUserId()){
            response.sendRedirect("/index");
        }

        if(title.isEmpty()){
            errors.put("title", "A title is required");
        }

        if(description.isEmpty()){
            errors.put("description", "A description is required");
        }

        if(errors.isEmpty()){
            ad.setTitle(title);
            ad.setDescription(description);

            DaoFactory.getAdsDao().update(ad);
            response.sendRedirect("/ads");
        } else {
            request.setAttribute("errors", errors);
            request.setAttribute("ad", ad);
            request.getRequestDispatcher("/WEB-INF/ads/update.jsp").forward(request, response);
        }
    }
}