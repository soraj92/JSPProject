package control;

import basic.Action;
import boardaction.AuctionAction;
import boardaction.BoardListAction;
import boardaction.LoginAction;
import boardaction.MemberChangeAction;
import boardaction.MemberUpdateAction;
import boardaction.MoveAction;
import boardaction.WriteAction;

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
		}else if(cmd.equals("/write.do"))
		{
			action = new WriteAction("index.com");
		}else if ( cmd.equals("/change.do")) {
			action = new MemberChangeAction("./index.jsp");
		}else if ( cmd.equals("/Update.do")) {
			action = new MemberUpdateAction("./page/memberchange.jsp");
		}
		return action;
	}

}
