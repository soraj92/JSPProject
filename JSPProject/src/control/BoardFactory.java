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
	Action form = null;
	
	public Action formInit(String cmd)
	{
		if(cmd.equals("/content.do"))
		{
			form = new MoveAction("page/Content.jsp");
		}
		return form;
	}

}
