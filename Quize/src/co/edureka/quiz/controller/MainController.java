package co.edureka.quiz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;



@WebServlet(urlPatterns = { "/login", "/register", "/logout", "/survey","/surveyview", "/surveyupload","/surveyresultList","/surveyresult","/paper","/contact" })
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String applicationContextPath = request.getContextPath();

		if (request.getRequestURI().equals(applicationContextPath + "/")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/login")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/login.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/register")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/register.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/survey")) {
			System.out.println(request.getSession().getAttribute("user"));
			if (request.getSession().getAttribute("user") == null) {
				request.getRequestDispatcher("/login").forward(request,	response);	
			}else{RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/survey.jsp");
				dispatcher.forward(request, response);}
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/surveyview")) {
			System.out.println(request.getSession().getAttribute("user"));
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/surveyview.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/surveyupload")) {
			System.out.println(request.getSession().getAttribute("user"));
			if (request.getSession().getAttribute("user") == null) {
				request.getRequestDispatcher("/login").forward(request,
						response);	
			}else{RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/surveyupload.jsp");
				dispatcher.forward(request, response);}
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/surveyresultList")) {
			System.out.println(request.getSession().getAttribute("user"));
			if (request.getSession().getAttribute("user") == null) {
				request.getRequestDispatcher("/login").forward(request,
						response);	
			}else{RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/surveyresultList.jsp");
				dispatcher.forward(request, response);}
		}else if (request.getRequestURI().equals(
				applicationContextPath + "/surveyresult")) {
			System.out.println(request.getSession().getAttribute("user"));
			RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/surveyresult.jsp");
				dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/paper")) {
			System.out.println(request.getSession().getAttribute("user"));
			if (request.getSession().getAttribute("user") == null) {
				request.getRequestDispatcher("/login").forward(request,
						response);	
			}else{RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/paper.jsp");
				dispatcher.forward(request, response);}
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/contact")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/contact.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/logout")) {
			request.getSession().invalidate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			dispatcher.forward(request, response);
		}

	}

}
