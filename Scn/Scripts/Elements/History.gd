extends Control

enum TYPES {RECIPE, EXPENSE, GLOBAL, NULL}
export (TYPES) var HistoryType
var History : RichTextLabel
var Picture : AnimatedSprite
var NodeParent

func _ready():
	History = get_node("Text")
	Picture = get_node("Img")
	NodeParent = get_parent()
	
	NodeParent.connect("Done", self, "HistoryUpdate")
	if !NodeParent.connect("Done", self, "HistoryUpdate"):
		HistoryUpdate()
	
func HistoryUpdate():
	match HistoryType:
		TYPES.RECIPE:
			HistorySize()
			Picture.frame = 1
			History.text = GetHistory()
			print ("Recipe History")
		TYPES.EXPENSE:
			HistorySize()
			Picture.frame = 1
			History.text = GetHistory()
			print ("Expense History")
		TYPES.GLOBAL:
			HistorySize()
			Picture.frame = 0
			History.text = GetHistory()
			print ("Global History")
		TYPES.NULL:
			HistorySize()
			History.text = GetHistory()
			print ("Null History")

func HistorySize():
	if HistoryType == TYPES.GLOBAL:
		History.margin_left = 64
		History.margin_right = 640
		History.margin_bottom = 768
		History.margin_top = 528
	else:
		History.margin_left = 64
		History.margin_right = 640
		History.margin_bottom = 808
		History.margin_top = 456

func GetHistory():
	var Text : String
	
	match HistoryType:
		TYPES.RECIPE:
			for recipe in FileUser.Recipe:
				Text += ("Nom: " + str(recipe.Name) + ", Montant: +" 
				+ str(recipe.Amount) + "EUR, " + str(recipe.Day) + 
				"/" + str(recipe.Month) + "/" + str(recipe.Year)  + "\n")
			return Text
		TYPES.EXPENSE:
			for expense in FileUser.Expense:
				Text += ("Nom: " + str(expense.Name) + ", Montant: -" 
				+ str(expense.Amount) + "EUR, " + str(expense.Day) + 
				"/" + str(expense.Month) + "/" + str(expense.Year)  + "\n")
			return Text
		TYPES.GLOBAL:
			var history : Array
			
			for expense in FileUser.Expense:
				history.append(expense)
			for recipe in FileUser.Recipe:
				history.append(recipe)
			
			for dict in history:
				if dict.Type == Functions.TYPE.RECIPE:
					Text += ("Nom: " + str(dict.Name) + ", Montant: +" 
					+ str(dict.Amount) + "EUR, " + str(dict.Day) + 
					"/" + str(dict.Month) + "/" + str(dict.Year)  + "\n")
				elif dict.Type == Functions.TYPE.EXPENSE:
					Text += ("Nom: " + str(dict.Name) + ", Montant: -" 
					+ str(dict.Amount) + "EUR, " + str(dict.Day) + 
					"/" + str(dict.Month) + "/" + str(dict.Year)  + "\n")
			return Text
		TYPES.NULL:
			return
