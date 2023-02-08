/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.CompteController;
import Controller.DataBaseController;
import static Interface.Connectivity.PASSWORD;
import static Interface.Connectivity.URL;
import static Interface.Connectivity.USER;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monseigneur Philippe
 */
@WebServlet(name = "authCompteServlet", urlPatterns = {"/authCompteServlet"})
public class AuthCompteServlet extends HttpServlet {
       CompteController compte;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultValue = false;
        String someResult = "Message par defaut !";
        String found = "faux"; 
        String action = "";    
        
        try {
             String loginPsw = request.getParameter("psw");
             String loginIdCard = request.getParameter("card_id");
       /*
        db = new DataBaseController(URL, USER, PASSWORD);
        db.getConnection();
             */
        compte = new CompteController();
        boolean loginResult = compte.login(loginPsw, loginIdCard);
        
        if(loginResult == true){
            
            action = "index";
            request.getSession().setAttribute("action", action);        
            response.sendRedirect("./index.jsp");
        }
        else{
            request.getSession().removeAttribute("msg");
            
            String msg = "Identifiants incorrects !";
            request.getSession().setAttribute("msg", msg);
            
            response.sendRedirect("./View/Auth/login.jsp");
            
            //request.getRequestDispatcher("./View/Auth/login.jsp").forward(request, response);
        }
        }
        catch(Exception ex){
            System.out.println(ex);
            
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter(); 
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");          
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Exception gérée : " + ex.toString() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
