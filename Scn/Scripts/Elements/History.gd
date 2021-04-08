extends Control

enum TYPES {RECIPE, EXPENSE, GLOBAL, NULL}
export (TYPES) var HistoryType = TYPES.NULL
var History : RichTextLabel
var Picture : AnimatedSprite
var NodeParent

func _ready():
	History = get_node("Text")
	Picture = get_node("Img")
	NodeParent = get_parent()
	NodeParent.connect("Done", self, "HistoryUpdate")
	
	
func HistoryUpdate():
	match HistoryType:
		TYPES.RECIPE:
			HistorySize()
			Picture.frame = 1
			History.text = str(Functions.SetRecipeHistory())
			print ("Recipe History")
		TYPES.EXPENSE:
			HistorySize()
			Picture.frame = 1
			History.text = str(Functions.SetExpenseHistory())
			print ("Expense History")
		TYPES.GLOBAL:
			HistorySize()
			Picture.frame = 0
			History.text = str(Functions.SetHistory())
			print ("Global History")
		TYPES.NULL:
			HistorySize()
			History.text = ""
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
