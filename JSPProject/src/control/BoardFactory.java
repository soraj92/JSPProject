package control;

import basic.Action;
import boardaction.BoardListAction;
import boardaction.MoveAction;

public class BoardFactory {
	
	private static BoardFactory init = null;
	private BoardFactory() {}
	
	public static BoardFactory getInstance()
	{
		if(init == null)
			init = new BoardFactory();
		return init;
	}
	Action action = null;
	
	public Action formInit(String cmd)
	{
		if(cmd.equals("/content.do"))
		{
			action = new MoveAction("page/BoardContent.jsp");
		}else if(cmd.equals("/boardList.do"))
		{
			action = new BoardListAction("page/BoardList.jsp");
		}
		return action;
	}

}
