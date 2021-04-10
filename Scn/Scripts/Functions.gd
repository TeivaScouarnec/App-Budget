extends Node

enum TYPE {RECIPE,EXPENSE,TAXES}

#Ajoute une recette
func AddRecipe(name:String, amount:float, day:int, month:int, year:int): 
	
	var Recipe = {
		"Name": name,
		"Amount": amount,
		"Day": day,
		"Month": month,
		"Year": year,
		"Type": TYPE.RECIPE
	}
	FileUser.Recipe.append(Recipe)
	print (FileUser.Recipe)

#déduit une recette
func RemoveRecipe(): 
	if !FileUser.Recipe == []:
		FileUser.Recipe.pop_back()
	print (FileUser.RecipeList)

#ajoute une dépense
func AddExpense(name:String, amount:float, day:int, month:int, year:int):
	var Expense = {
		"Name": name,
		"Amount": amount,
		"Day": day,
		"Month": month,
		"Year": year,
		"Type": TYPE.EXPENSE
	}
	FileUser.Expense.append(Expense)
	print (FileUser.Expense)

#réduit une dépense
func RemoveExpense():
	if !FileUser.Expense == []:
		FileUser.Expense.pop_back()
	print (FileUser.Expense)

#calcule le solde total
func ForecastBalance(): 
	var RecipeAmount : float
	var ExpenseAmount : float
	var BalanceAmount : float
	
	for amount in FileUser.Recipe:
		RecipeAmount += amount.Amount
		
	for amount in FileUser.Expense:
		ExpenseAmount += amount.Amount
	
	if RecipeAmount == null:
		RecipeAmount = 0
	if ExpenseAmount == null:
		ExpenseAmount = 0
	
	print (RecipeAmount)
	print (ExpenseAmount)
	
	BalanceAmount = RecipeAmount - ExpenseAmount
	BalanceAmount = stepify(BalanceAmount,0.001)
	return BalanceAmount
	FileUser.Save_File()

func Balance():
	var Recipe
	var Expense
	var RecipeAmount : float
	var ExpenseAmount : float
	var BalanceAmount : float
	
	for amount in FileUser.Recipe:
		if !amount.Day > FileUser.CurrentDay:
			RecipeAmount += amount.Amount
		
	for amount in FileUser.Expense:
		if !amount.Day > FileUser.CurrentDay:
			ExpenseAmount += amount.Amount
	
	if RecipeAmount == null:
		RecipeAmount = 0
	if ExpenseAmount == null:
		ExpenseAmount = 0
	
	print (RecipeAmount)
	print (ExpenseAmount)
	
	BalanceAmount = RecipeAmount - ExpenseAmount
	BalanceAmount = stepify(BalanceAmount,0.001)
	return BalanceAmount
	FileUser.Save_File()

func GetDateDay(): #Obtient le jour
	var GetDate = OS.get_date()
	var SetDate = int(GetDate.day)
	print (SetDate)
	return SetDate

func GetDateMonth(): #Obtient le Mois
	var GetDate = OS.get_date()
	var SetDate = int(GetDate.month)
	return SetDate

func GetDateYear(): #Obtient l'année
	var GetDate = OS.get_date()
	var SetDate = int(GetDate.year)
	return SetDate
