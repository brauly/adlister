package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@WebServlet(name = "UpdateServlet", urlPatterns = "/ads/update")
public class UpdateServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            User user = (User) request.getSession().getAttribute("user");
            Long id = Long.parseLong(request.getParameter("id"));
            String referer = request.getHeader("Referer");
            request.getSession().setAttribute("previousPage", referer);
            Ad ad = DaoFactory.getAdsDao().findById(id);

            if(user == null || user.getId() != ad.getUserId()){
                response.sendRedirect("/login");
            }else{
                request.setAttribute("ad", ad);
                List<Category> categories = DaoFactory.getCategoriesDao().all();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/WEB-INF/ads/update.jsp")
                        .forward(request, response);
            }
        }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Long category = Long.parseLong(request.getParameter("category"));
        Long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().findById(id);
        HashMap errors = new HashMap();

        if(user.getId() != ad.getUserId()){
            response.sendRedirect("/index");
        }

        if(title.isEmpty()){
            errors.put("title", "<div class='alert alert-danger'>A title is required</div>");
        }

        if(description.isEmpty()){
            errors.put("description", "<div class='alert alert-danger'>A description is required</div>");
        }

        if(errors.isEmpty()){
            ad.setTitle(title);
            ad.setDescription(description);
            ad.setCategoryId(category);


            DaoFactory.getAdsDao().update(ad);
           String referer = (String) request.getSession().getAttribute("previousPage");
        response.sendRedirect(referer);
//            response.sendRedirect("/ads");
        } else {
            List<Category> categories = DaoFactory.getCategoriesDao().all();
            request.setAttribute("categories", categories);
            request.setAttribute("errors", errors);
            request.setAttribute("ad", ad);
            request.getRequestDispatcher("/WEB-INF/ads/update.jsp").forward(request, response);
        }
    }
}