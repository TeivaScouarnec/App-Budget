extends Control

var RecipeHistory : RichTextLabel
var RecipeName : LineEdit
var RecipeValue : LineEdit

var Undo : bool

signal Done

func _ready():
	RecipeHistory = get_node("RecipeHistory/Text")
	RecipeName = get_node("RecipePanel/Name")
	RecipeValue = get_node("RecipePanel/Amount")
	
	RecipeHistory.text = str(Functions.SetRecipeHistory())


func _on_Add_pressed():
	if RecipeName.text == "":
		RecipeName.text = "Recette"
	Functions.Add_Recipe(RecipeName.text,RecipeValue.CheckText())
	Functions.Balance()
	RecipeHistory.text = str(Functions.SetRecipeHistory())
	RecipeName.clear()
	emit_signal("Done")
	RecipeValue.text = ""
	Undo = true

func _on_Close_pressed():
	queue_free()

func _on_Undo_pressed():
	if Undo == true:
		Functions.Remove_Recipe()
		RecipeHistory.clear()
		RecipeHistory.text = str(Functions.SetRecipeHistory())
		Functions.Balance()
		emit_signal("Done")
		Undo = false
	else:
		print ("No")
