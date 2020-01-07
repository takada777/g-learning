package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet)")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String cls =request.getParameter("class");
		int id =Integer.parseInt(request.getParameter("id"));
		String name =request.getParameter("name");
		String pass =request.getParameter("pass");
		String adress =request.getParameter("adress");
		String error = "そのIDは既に使用されています。";

		DBRelation dbr = new DBRelation();
		HttpSession session=request.getSession();

		if(dbr.IdDuplicateCheck(id)){
			session.setAttribute("error", error);
			getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
		}else{
			dbr.DBInsert(cls, id, name, pass, adress);
			response.sendRedirect("Login.jsp");
		}
	}
}
