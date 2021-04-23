extends Control

enum TYPES {RECIPE, EXPENSE, NULL}

var Title : Label
var LineEditText: LineEdit
var NodeParent

func _ready():
	LineEditText = get_node("NameText")
	Title = get_node("Title")
	NodeParent = get_parent()
	NameUpdate()
	
func NameUpdate():
	var ParentType = NodeParent.NameType
	match ParentType:
		TYPES.RECIPE:
			Title.text = "Nom de la recette (*)"
		TYPES.EXPENSE:
			Title.text = "Nom de la dépense (*)"
		TYPES.NULL:
			Title.text = ""

func GetName():
	if !LineEditText.text == "":
		return (str(LineEditText.text))
		LineEditText.text = ""
	else:
		return
