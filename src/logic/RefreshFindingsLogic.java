package logic;

import java.sql.Date;
import cache.UserIdInSystem;

public class RefreshFindingsLogic {

	public static void changeFinding(int findingID, String findingName, Date findingDate, String findingPlace,
			String findingDescription, String category) {

		int categoryId = Logic.getFindingCategory().getCategoryIdForCategoryName(category);
		Logic.getFinding().changeFinding(findingID, findingName, findingDate, findingPlace, findingDescription, categoryId);
	}
	
	public static void addFinding( String findingName, Date findingDate, String findingPlace,
			String findingDescription, String category) {
		int categoryId = Logic.getFindingCategory().getCategoryIdForCategoryName(category);
		Logic.getFinding().addNewFinding(findingName, findingDate, findingPlace, findingDescription, UserIdInSystem.userID, categoryId);
	}
	
}