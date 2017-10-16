package co.edureka.quiz;

import java.sql.*;


public class DatabaseConnectionFactory {
	
	private static String dbURL="jdbc:oracle:thin:@localhost:1521:xe";
	private static String dbUser="root";
	private static String dbPassword="1234";

	public static Connection createConnection(){
	 Connection con=null;
		try{
			try {
				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   System.out.println("driver load success");
				}
				catch(ClassNotFoundException ex) {
				   System.out.println("Error: unable to load driver class!");
				   System.exit(1);
				}			
		     con = DriverManager.getConnection(dbURL,dbUser,dbPassword);
		     System.out.println("OK");
		   }
		  catch(SQLException sqe){ 
			  System.out.println("Error: While Creating connection to database");
			  sqe.printStackTrace();
		}
		return con;
	}
	
}
	




