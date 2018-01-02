package control;

import basic.Action;
import boardaction.MainListAction;

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
		if(cmd.equals("/index.jsp"))
		{
			action =  new MainListAction("index.jsp");
		}
		
		return action;
	}
}
