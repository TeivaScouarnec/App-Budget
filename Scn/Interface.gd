extends Control

var Recipe_Value : float = 0
var Expense_Value : float = 0
var Balance_Value : float = 0

var Recipe_Label : Label
var Expense_Label : Label
var Balance_Label : Label

func _ready():
	Recipe_Label = get_node("Recipe_Title/Recipe_value")
	Expense_Label = get_node("Expense_Title/expense_value")
	Balance_Label = get_node("Balance_Title/Balance_value")
	
	Load_File()
	
	Recipe_Label.text = str(Recipe_Value)
	Expense_Label.text = str(Expense_Value)
	Balance()
	
func Add_Recipe(amount):
	Recipe_Value += amount
	Recipe_Label.text = str(Recipe_Value)
	Balance()
	
func Remove_Recipe(amount):
	Recipe_Value -= amount
	Recipe_Label.text = str(Recipe_Value)
	Balance()
	
func Add_Expense(amount):
	Expense_Value += amount
	Expense_Label.text = str(Expense_Value)
	Balance()
	
func Remove_Expense(amount):
	Expense_Value -= amount
	Expense_Label.text = str(Expense_Value)
	Balance()
	
func Balance():
	Balance_Value = Recipe_Value - Expense_Value
	Balance_Label.text = str(Balance_Value)
	Save_File()

func Save_File():
	var Save_dict = {
		"FileName" : get_filename(),
		"MyRecipe" : Recipe_Value,
		"MyExpense" : Expense_Value
	}
	
	var Save_File = File.new()
	
	Save_File.open("res://User/UserSave.save",File.WRITE)
	Save_File.store_line(to_json(Save_dict))
	Save_File.close()
	
	print ("Save File")

func Load_File():
	var Save_file = File.new()
	if not Save_file.file_exists("res://User/UserSave.save"):
		return
	
	Save_file.open("res://User/UserSave.save",File.READ)
	var File_data = parse_json(Save_file.get_line())
	var New_Object = load(File_data["FileName"]).instance()
	Recipe_Value = File_data["MyRecipe"]
	Expense_Value = File_data["MyExpense"]
	Save_file.close()
