extends Node

var Recipe : Array = []
var Expense : Array = []
var Taxes : Array = []

var CurrentDay
var CurrentMonth
var CurrentYear

func _ready():
	CurrentDay = Functions.GetDateDay()
	CurrentMonth = Functions.GetDateMonth()
	CurrentYear = Functions.GetDateYear()
	

func Save_File():
	var dir = Directory.new()
	dir.open("user://")
	if !dir.dir_exists("GdBugdet"):
		dir.make_dir("GdBugdet")
	
	var Save_dict = {
		"FileName" : get_filename(),
		"MyRecipe" : Recipe,
		"MyExpense" : Expense,
		"MyTaxes" : Taxes,
	}
	var Save_File = File.new()
	Save_File.open("user://GdBugdet/UserSave.save",File.WRITE)
	Save_File.store_line(to_json(Save_dict))
	Save_File.close()
	print ("Save File")

func Load_File():
	var Save_file = File.new()
	if not Save_file.file_exists("user://GdBugdet/UserSave.save"):
		return
	Save_file.open("user://GdBugdet/UserSave.save",File.READ)
	var File_data = parse_json(Save_file.get_line())
	var New_Object = load(File_data["FileName"])
	Recipe = File_data["MyRecipe"]
	Expense = File_data["MyExpense"]
	Taxes = File_data["MyTaxes"]
	Save_file.close()
	
func list_files_in_directory():
	var files = []
	var dir = Directory.new()
	dir.open("user://GdBugdet/")
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files
	
func Clear():
	var Files = list_files_in_directory()
		
	print (Files)
	
	if !Files.empty():
		for file in Files:
			var Dir = Directory.new()
			Dir.remove("user://GdBugdet/" + str(file))
			print ("Delete")

	Recipe = []
	Expense = []
	Taxes = []
	
	print (Files)
