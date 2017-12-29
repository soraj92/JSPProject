package control;

import basic.Action;
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
			action = new MoveAction("page/Content.jsp");
		}
		return action;
	}

}
