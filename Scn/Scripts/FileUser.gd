extends Node

var Recipe_Value : float = 0
var Expense_Value : float = 0
var Balance_Value : float = 0
var Taxes_Value : float = 0

var Recipe_List : Array
var Expense_List : Array
var Taxes_List : Array
var History : Array

var CurrentDate

func _ready():
	CurrentDate = Functions.GetDateEnter()

func Save_File():
	var Save_dict = {
		"FileName" : get_filename(),
		"MyRecipeAmount" : Recipe_Value,
		"MyExpenseAmount" : Expense_Value,
		"MyTaxesAmount" : Taxes_Value,
		"MyRecipeHistory" : Recipe_List,
		"MyExpenseHistory" : Expense_List,
		"MyTaxesHistory" : Taxes_List,
		"MyHistory" : History,
		"LastDate" : CurrentDate
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
	var New_Object = load(File_data["FileName"])
	Recipe_Value = File_data["MyRecipeAmount"]
	Expense_Value = File_data["MyExpenseAmount"]
	Taxes_Value = File_data["MyTaxesAmount"]
	Recipe_List = File_data["MyRecipeHistory"]
	Expense_List = File_data["MyExpenseHistory"]
	Taxes_List = File_data["MyTaxesHistory"]
	History = File_data["MyHistory"]
	Save_file.close()
	
func Clear():
	Recipe_Value = 0
	Expense_Value = 0
	Balance_Value  = 0
	Taxes_Value = 0
	Recipe_List = []
	Expense_List = []
	Taxes_List = []
	History = []
	Save_File()
