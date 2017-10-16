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

import co.edureka.quiz.DBClose;
import co.edureka.quiz.DatabaseConnectionFactory;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/upload")
public class SurveyUploadController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
//      Calendar rightNow = Calendar.getInstance();
//      String now = rightNow.toString();
	  String username=(String) request.getSession().getAttribute("user");
      String survey_title=request.getParameter("survey_title");
      String st1=request.getParameter("st1");
      String st2=request.getParameter("st2");
      String st3=request.getParameter("st3");
      String st4=request.getParameter("st4");
      String st5=request.getParameter("st5");
      
      
      
   //   String password=request.getParameter("password");
      
      Connection con=DatabaseConnectionFactory.createConnection();

      try{
	      Statement st=con.createStatement();
	      
	      String sql = "INSERT INTO survey values (seq.nextval,'"+username+"','"+survey_title+"','"+st1+"','"+st2+"'"
             + ",'"+st3+"','"+st4+"','"+st5+"')";
          System.out.println(sql);
          st.executeUpdate(sql);
      }catch(SQLException sqe){
    	  System.out.println("Error : While Inserting record in database");
    	  }
      try{
    	  con.close();   
      }catch(SQLException se){
    	  System.out.println("Error : While Closing Connection");
    	  }
        request.setAttribute("newSur",survey_title);
	    RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsps/uploadSuccess.jsp");
	    dispatcher.forward(request, response);      
   }
   
}