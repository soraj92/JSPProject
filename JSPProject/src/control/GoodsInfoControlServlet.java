package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;

@WebServlet("*.goods")
public class GoodsInfoControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String requestURI = req.getRequestURI();
		System.out.println("requestURI : "+requestURI);
		
		String contextPath =  req.getContextPath();
		System.err.println("contextPath : "+ contextPath);
		
		String cmd =requestURI.substring(contextPath.length());
		System.out.println("cmd :" +cmd);
		
		// 필수작업
		//1) cmd에 따라서 액션 생성 
		GoodsInfoFactory gif = GoodsInfoFactory.getInstance();
		Action action = gif.formgif(cmd);
		
		//2) 엑션에 일 시키기 
		ActionForward af = null;
		try
		{
			af = action.execute(req, res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//결과에 따라 이동 
		if(af.isRedirect())
		{
			res.sendRedirect(af.getPath());
		}else
		{
			RequestDispatcher rd = req.getRequestDispatcher(af.getPath());
					rd.forward(req, res);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
