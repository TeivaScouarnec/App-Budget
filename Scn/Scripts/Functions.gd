extends Node

func AddRecipe(name:String, amount:float): #Ajoute une recette
	var RecipeName = name
	var RecipeAmount = amount
	var RecipeText = "Recette: " + str(RecipeName) + ", Montant: +" + str(RecipeAmount) + ", " + str(GetDateEnter())
	FileUser.RecipeValue += RecipeAmount
	FileUser.RecipeAmount.append(RecipeAmount)
	FileUser.RecipeList.append(RecipeText)
	FileUser.History.append(RecipeText)
	
func RemoveRecipe(): #déduit une recette
	if FileUser.RecipeAmount == [] or FileUser.RecipeList == []:
		print ("Non Exécuté")
		return
	
	var LastAmount = FileUser.RecipeAmount.back()
	FileUser.RecipeList.pop_back()
	FileUser.History.pop_back()
	FileUser.RecipeValue -= float(LastAmount)
	FileUser.RecipeAmount.pop_back()
	
func AddExpense(name:String,amount:float): #ajoute une dépense
	var ExpenseName = name
	var ExpenseAmount = amount
	var ExpenseText = "Dépense: " + str(ExpenseName) + ", Montant: -" + str(ExpenseAmount) + ", " + str(GetDateEnter())
	FileUser.ExpenseValue += ExpenseAmount
	FileUser.ExpenseAmount.append(ExpenseAmount)
	FileUser.ExpenseList.append(ExpenseText)
	FileUser.History.append(ExpenseText)
	
func RemoveExpense(): #réduit une dépense
	if FileUser.ExpenseAmount == [] or FileUser.ExpenseList == []:
		print ("Non Exécuté")
		return
	
	var LastAmount = FileUser.ExpenseAmount.back()
	FileUser.ExpenseList.pop_back()
	FileUser.History.pop_back()
	FileUser.ExpenseValue -= float(LastAmount)
	FileUser.ExpenseAmount.pop_back()
	
func Balance(): #calcule le solde total
	print (FileUser.BalanceValue)
	FileUser.BalanceValue = 0
	FileUser.BalanceValue += FileUser.RecipeValue
	FileUser.BalanceValue -= FileUser.ExpenseValue
	FileUser.BalanceValue -= FileUser.TaxesValue
	FileUser.BalanceValue = stepify(FileUser.BalanceValue,0.001)
	print (FileUser.BalanceValue)
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
	for obj in FileUser.RecipeList:
		HistoryText += str(obj) + "\n"
	
	return HistoryText

func SetExpenseHistory(): #Ajoute des entrées dans l'historique des dépenses
	var HistoryText : String
	for obj in FileUser.ExpenseList:
		HistoryText += str(obj) + "\n"
	
	return HistoryText
