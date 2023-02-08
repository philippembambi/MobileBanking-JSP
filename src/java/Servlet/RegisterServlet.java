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
import Controller.DataBaseController;
/**
 *
 * @author Monseigneur Philippe
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {

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
             String lastname = request.getParameter("lastname");
             String firstname = request.getParameter("firstname");
             String sex = request.getParameter("sex");
             String civilState = request.getParameter("civilian_state");
             String phone = request.getParameter("phone");
             String job = request.getParameter("profession");
             String birthdate = request.getParameter("birthday");
             String nationality = request.getParameter("nationality");
       
            compte = new CompteController();
            boolean registerResult = compte.register(lastname, firstname, sex, phone, birthdate, nationality, job, civilState);

            if(registerResult == true){
                action = "index";
                request.getSession().setAttribute("action", action);        
                response.sendRedirect("./View/Auth/createAccount.jsp");
            }
            else{
                request.getSession().removeAttribute("msg");

                String msg = "Une erreur a survenu !";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("./View/Auth/register.jsp");
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
