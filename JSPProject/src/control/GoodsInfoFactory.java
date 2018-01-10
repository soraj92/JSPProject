package control;

import basic.Action;
import boardaction.MainListAction;
import boardaction.MyPageAction;
import boardaction.TradeChangeAction;
import boardaction.WriteAction;

public class GoodsInfoFactory {

	private static GoodsInfoFactory gif = null;
	// 단 하나의 객체만 생성할 수 있도록 한다.
	private GoodsInfoFactory() {} // 생성자 못만들게 막음
	public static GoodsInfoFactory getInstance()
	{
		if(gif == null)
			gif = new GoodsInfoFactory();
		return gif;
	}
	
	Action action = null;
	
	public Action formgif(String cmd)
	{
		if(cmd.equals("/index.com"))
	      {
	         action =  new MainListAction("index.jsp");
	         
	      }else if (cmd.equals("/myPage.com"))
	      {
	         action = new MyPageAction("page/myP.jsp");
	         
	      }else if (cmd.equals("/trade_change.com"))
	      {
	         action = new TradeChangeAction("myPage.com");
	         
	      }
		
		return action;
	}
}
