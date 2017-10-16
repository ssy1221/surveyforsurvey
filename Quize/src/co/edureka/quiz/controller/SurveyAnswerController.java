package co.edureka.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edureka.quiz.DatabaseConnectionFactory;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/answer")
public class SurveyAnswerController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=(String) request.getSession().getAttribute("user");
		String an1=request.getParameter("an1");
		String an2=request.getParameter("an2");
		String an3=request.getParameter("an3");
		String an4=request.getParameter("an4");
		String an5=request.getParameter("an5");
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try{		
			Statement st=con.createStatement();
			
			String sql = "INSERT INTO answer values ('"+username+"','"+an1+"','"+an2+"','"+an3+"','"+an4+"','"+an5+"')";
		 	System.out.println(sql);
		 	st.executeUpdate(sql);
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
		} 
		try{
		 con.close();	
		}catch(SQLException se){System.out.println("Error : While Closing Connection");}
        request.setAttribute("newAnswer",username);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsps/AnswerSuccess.jsp");
		dispatcher.forward(request, response);		
	}
   
}