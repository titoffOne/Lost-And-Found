package command;


import javax.servlet.http.HttpServletRequest;
import coder.Coder;
import datalayer.data.FinalQuestion;
import resource.ConfigurationManager;
import temporary.data.FinalQuestions;

public class RefreshFinalQuestion implements ActionCommand {

	@Override
	public String execute(HttpServletRequest request) {

		String page = null;

		int finalquestionid = Integer.parseInt(request.getParameter("finalquestionid"));
		changeFinalQuestion(request);

		request.setAttribute("foundItems",
				FinalQuestions.getQuestionsForFinding(FinalQuestions.getFindingIdForQuestionId(finalquestionid)));

		if (request.getParameter("client").equals("moderator")) {
			page = ConfigurationManager.getProperty("path.page.finaquestions_moderator");
		}
		if (request.getParameter("client").equals("receiver")) {
			page = ConfigurationManager.getProperty("path.page.receiver.finalquestions");
		}

		return page;
	}

	private void changeFinalQuestion(HttpServletRequest request) {
		int finalquestionid = Integer.parseInt(request.getParameter("finalquestionid"));
		for (FinalQuestion finalQuestion : FinalQuestions.finalQuestionsList) {
			if (finalQuestion.getId() == finalquestionid) {
				finalQuestion.setQuestion((Coder.toUTF8(request.getParameter("question"))));
				finalQuestion.setRightAnswer((Coder.toUTF8(request.getParameter("rightAnswer"))));
				finalQuestion.setAlternativeAnswer1((Coder.toUTF8(request.getParameter("alternativeAnswer1"))));
				finalQuestion.setAlternativeAnswer2((Coder.toUTF8(request.getParameter("alternativeAnswer2"))));

			}
		}
	}

}
