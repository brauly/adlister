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

import static com.sun.tools.doclets.formats.html.markup.HtmlStyle.description;
import static com.sun.tools.doclets.formats.html.markup.HtmlStyle.title;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
       List<Category> categories = DaoFactory.getCategoriesDao().all();
       request.setAttribute("categories", categories);
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;

        }

        List<Category> categories = DaoFactory.getCategoriesDao().all();
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        HashMap errors = new HashMap();

        if(title.isEmpty()){
            errors.put("title", "<div class='alert alert-danger'>A title is required</div>");
            request.setAttribute("categories", categories);
        }

        if(description.isEmpty()){
            errors.put("description", "<div class='alert alert-danger'>A description is required</div>");
            request.setAttribute("categories", categories);
        }

        if(errors.isEmpty()){
         Ad ad = new Ad(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description"),
                Long.parseLong(request.getParameter("category"))
        );
            ad.setTitle(title);
            ad.setDescription(description);
//            ad.setCategoryId(category);
            request.setAttribute("ad", ad);

        DaoFactory.getAdsDao().insert(ad);
//            List<Category> categories = DaoFactory.getCategoriesDao().all();
//            request.setAttribute("categories", categories);
        response.sendRedirect("/ads");
        } else {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
        }
    }
}