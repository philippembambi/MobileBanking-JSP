/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.CompteController;
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
@WebServlet(name = "completeRegistration", urlPatterns = {"/completeRegistration"})
public class CompleteRegistrationServlet extends HttpServlet {
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
             String someResult = "Default Message !";
             String found = "faux"; 
             String action;    
        
        try {
             String psw = request.getParameter("psw");
             String confirm_psw = request.getParameter("confirm_psw");
             String accounType = request.getParameter("accounType");
             
             if(psw.compareTo(confirm_psw) == 0) {
              
                   compte = new CompteController();
                   boolean registerResult = compte.completeRegistration(psw, accounType);

                   if(registerResult == true){
                       action = "index";
                       request.getSession().setAttribute("action", action);        
                       response.sendRedirect("./index.jsp");
                   }
                   else{
                       String msg = "Une erreur a survenu !";
                       request.getSession().removeAttribute("msg");
                       request.getSession().setAttribute("msg", msg);
                       response.sendRedirect("./View/Auth/createAccount.jsp");
                   }

             }
             else{
                String msg = "Mot de passe de confirmation incorrect !";
                request.getSession().removeAttribute("msg");
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("./View/Auth/createAccount.jsp");
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
