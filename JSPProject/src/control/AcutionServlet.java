package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AcutionServlet
 */
@WebServlet("/AcutionServlet")
public class AcutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String price = request.getParameter("price");
		String board_num = request.getParameter("board_num");
		System.out.println(price);
		System.out.println(board_num);
		BoardDAO dao = new BoardDAO();
		int result = dao.UpdateAuctionPrice(Integer.parseInt(board_num), Integer.parseInt(price));
		response.getWriter().write(result+"");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
