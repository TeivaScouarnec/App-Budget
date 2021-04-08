extends Control

enum TYPES {RECIPE, EXPENSE, NULL}
export (TYPES) var NameType = TYPES.NULL

var Title : Label
var LineEditText: LineEdit

func _ready():
	LineEditText = get_node("NameText")
	Title = get_node("Title")
	NameUpdate()
	
func NameUpdate():
	match NameType:
		TYPES.RECIPE:
			Title.text = "Nom de la recette"
		TYPES.EXPENSE:
			Title.text = "Nom de la dépense"
		TYPES.NULL:
			Title.text = ""

func NameText():
	if !LineEditText.text == "":
		return (LineEditText.text)
		LineEditText.text = ""

