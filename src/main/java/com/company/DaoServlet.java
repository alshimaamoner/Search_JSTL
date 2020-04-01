/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class DaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Result> resultList=new ArrayList<>();
        response.setContentType("text/html");
        String name = request.getParameter("name");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "password");
            PreparedStatement stmt = con.prepareStatement("select * from user where firstName like ? Or lastName like ? ;");
            stmt.setString(1, "%" + name + "%");
            stmt.setString(2, "%" + name + "%");

            ResultSet rs = stmt.executeQuery();
            System.err.println(rs);
            while(rs.next()){
                String fname = rs.getString("firstName");
                String lname = rs.getString("lastName");
                String username = rs.getString("name");
                String pass = rs.getString("pass");
                  
                resultList.add(new Result(username,pass,fname,lname));
            }
            request.setAttribute("result", resultList);
            RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
