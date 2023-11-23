package command;

import javax.servlet.http.HttpServletRequest;
import logic.FindingsLogic;
import resource.ConfigurationManager;
//Требует работы с БД
public class MyFindingsCommand implements ActionCommand{
	@Override
	public String execute(HttpServletRequest request) {
		String page = null;
		
		try {
			if (request.getParameter("setOwnershipForUser").equals("true")) {
				FindingsLogic.setUserForFinding(Integer.parseInt(request.getParameter("findingId")), (int)request.getSession().getAttribute("userId"));
			}
		} catch (Exception e) {
			//
		}
		
		
		request.setAttribute("foundItems", FindingsLogic.getFindingForUser((int)request.getSession().getAttribute("userId")));
		page = ConfigurationManager.getProperty("path.page.myfindings_user");
		return page;
	}
}
