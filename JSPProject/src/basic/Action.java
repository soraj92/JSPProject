package basic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);
	//cmd의 따라 작업을 해줄 모든 action 들의 부모, 모든 action들에게 동일한 틀을 제공하기 위한 인터페이스
	
}
