package control;

import basic.Action;
import boardaction.AuctionAction;
import boardaction.BoardListAction;
import boardaction.LoginAction;
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
		}else if (cmd.equals("/login.do")) {
			
			action = new LoginAction("./index.jsp");
		}else if (cmd.equals("/auction.do")) {
			
			action = new AuctionAction("page/Auction.jsp");
			System.out.println("zzz");
		}
		return action;
	}

}
