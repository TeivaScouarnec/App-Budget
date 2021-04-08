extends Control

var RecipeName : LineEdit
var RecipeValue : LineEdit

var Undo : bool

signal Done

func _ready():
	RecipeName = get_node("RecipePanel/Name")
	RecipeValue = get_node("RecipePanel/Amount")
	emit_signal("Done")

func _on_Add_pressed():
	if RecipeName.text == "":
		RecipeName.text = "Recette"
	Functions.AddRecipe(RecipeName.text,RecipeValue.CheckText())
	Functions.Balance()
	RecipeName.clear()
	emit_signal("Done")
	RecipeValue.text = ""
	Undo = true

func _on_Close_pressed():
	queue_free()

func _on_Undo_pressed():
	if Undo == true:
		Functions.RemoveRecipe()
		Functions.Balance()
		emit_signal("Done")
		Undo = false
	else:
		print ("No")
