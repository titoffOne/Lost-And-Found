package command;

import javax.servlet.http.HttpServletRequest;

import coder.Coder;
import datalayer.data.Finding;
import resource.ConfigurationManager;
import temporary.data.Findings;
import java.sql.Date;

public class RefreshFindingsCommand implements ActionCommand{
	
	@Override
	public String execute(HttpServletRequest request) {
		
		String page = null;

		
		if (request.getParameter("client").equals("user")) {
			page = ConfigurationManager.getProperty("path.page.findings_user");
		}else if (request.getParameter("client").equals("moderator")) {
			page = ConfigurationManager.getProperty("path.page.findings_moderator");
			if (request.getParameter("act").equals("edit")) {
				changeFinding(request);
			}
		}
		request.setAttribute("foundItems", Findings.findingsList);
		return page;
	}



	private void changeFinding(HttpServletRequest request) {
		int findingID = Integer.parseInt(request.getParameter("findingid"));
		for (Finding finding : Findings.findingsList) {
			if (finding.getId() == findingID) {
				finding.setName((Coder.toUTF8(request.getParameter("findingName"))));
				finding.setDescription((Coder.toUTF8(request.getParameter("findingDescription"))));
				finding.setDate(Date.valueOf(Coder.toUTF8(request.getParameter("findingDate"))));
				finding.setPlace((Coder.toUTF8(request.getParameter("findingLocation"))));
				finding.setCategory(Coder.toUTF8(request.getParameter("findingCategory")));
			}
		}
	}



}
