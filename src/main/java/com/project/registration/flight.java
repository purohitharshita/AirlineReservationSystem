package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/flight")
public class flight extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String source = request.getParameter("departure");
        String destination = request.getParameter("destination");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false", "root",
                    "root@123");

            // Check if source and destination are the same
            if (source.equals(destination)) {
                session.setAttribute("status", "failed");
            } else {
                // Check flight availability
                PreparedStatement checkAvailability = con
                        .prepareStatement("select * from flight where source = ? and destination = ?");
                checkAvailability.setString(1, source);
                checkAvailability.setString(2, destination);

                ResultSet rs = checkAvailability.executeQuery();

                if (rs.next()) {
                    session.setAttribute("status", "success");
                } else {
                    session.setAttribute("status", "failed");
                }
            }

            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions properly in a real application
        }finally {
        	try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
}
