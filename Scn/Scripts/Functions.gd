extends Node

func Add_Recipe(name,amount): #Ajoute une recette
	var RecipeName = name
	var RecipeAmount = amount
	var RecipeText = "Recette: " + str(RecipeName) + ", Montant: +" + str(RecipeAmount) + ", " + str(GetDateEnter())
	FileUser.Recipe_Value += RecipeAmount
	FileUser.Recipe_List.append(RecipeText)
	FileUser.History.append(RecipeText)
	
func Remove_Recipe(name,amount): #déduit une recette
	var RecipeName = name
	var RecipeAmount = amount
	var RecipeText = "Recette: " + str(RecipeName) + ", Montant: -" + str(RecipeAmount) + ", " + str(GetDateEnter())
	FileUser.Recipe_Value -= RecipeAmount
	FileUser.Recipe_List.append(RecipeText)
	FileUser.History.append(RecipeText)
	
func Add_Expense(name,amount): #ajoute une dépense
	var ExpenseName = name
	var ExpenseAmount = amount
	var ExpenseText = "Dépense: " + str(ExpenseName) + ", Montant: -" + str(ExpenseAmount) + ", " + str(GetDateEnter())
	FileUser.Expense_Value += ExpenseAmount
	FileUser.Expense_List.append(ExpenseText)
	FileUser.History.append(ExpenseText)
	
func Remove_Expense(name,amount): #réduit une dépense
	var ExpenseName = name
	var ExpenseAmount = amount
	var ExpenseText = "Dépense: " + str(ExpenseName) + ", Montant: +" + str(ExpenseAmount) + ", " + str(GetDateEnter())
	FileUser.Expense_Value -= ExpenseAmount
	FileUser.Expense_List.append(ExpenseText)
	FileUser.History.append(ExpenseText)
	
func Balance(): #calcule le solde total
	FileUser.Balance_Value = 0
	FileUser.Balance_Value += FileUser.Recipe_Value
	FileUser.Balance_Value -= FileUser.Expense_Value
	FileUser.Balance_Value -= FileUser.Taxes_Value
	FileUser.Save_File()

func GetDateEnter(): #Obtient la date
	var GetDate = OS.get_date()
	var SetDate = str(GetDate.day) + "/" + str(GetDate.month) + "/" + str(GetDate.year)
	return SetDate

func SetHistory(): #Rajoute des entrées dans l'historique général
	var HistoryText : String
	for obj in FileUser.History:
		HistoryText += str(obj) + "\n"
	
	return HistoryText
	
func SetRecipeHistory(): #Ajoute des entrées dans l'historique des recettes
	var HistoryText : String
	for obj in FileUser.Recipe_List:
		HistoryText += str(obj) + "\n"
	
	return HistoryText

func SetExpenseHistory(): #Ajoute des entrées dans l'historique des dépenses
	var HistoryText : String
	for obj in FileUser.Expense_List:
		HistoryText += str(obj) + "\n"
	
	return HistoryText
