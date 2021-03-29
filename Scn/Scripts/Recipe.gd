extends Control

var SoldAmount : Label
var RecipeAmount : Label
var RecipeHistory : RichTextLabel
var RecipeName : LineEdit
var RecipeValue : SpinBox

signal Done

func _ready():
	SoldAmount = get_node("Sold/Amount")
	RecipeAmount = get_node("Recipe/Amount")
	RecipeHistory = get_node("RecipeHistory/Text")
	RecipeName = get_node("RecipePanel/Text")
	RecipeValue = get_node("RecipePanel/Amount")
	
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	RecipeAmount.text = str(FileUser.Recipe_Value) + "EUR"
	
	RecipeHistory.text = str(Functions.SetRecipeHistory())


func _on_Add_pressed():
	if RecipeName.text == "":
		RecipeName.text = "Recette"
	Functions.Add_Recipe(RecipeName.text,RecipeValue.value)
	Functions.Balance()
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	RecipeAmount.text = str(FileUser.Recipe_Value) + "EUR"
	RecipeHistory.text = str(Functions.SetRecipeHistory())
	RecipeName.clear()
	emit_signal("Done")


func _on_Remove_pressed():
	if RecipeName.text == "":
		RecipeName.text = "Recette"
	Functions.Remove_Recipe(RecipeName.text,RecipeValue.value)
	Functions.Balance()
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	RecipeAmount.text = str(FileUser.Recipe_Value) + "EUR"
	RecipeHistory.text = str(Functions.SetRecipeHistory())
	RecipeName.clear()
	emit_signal("Done")

func _on_Close_pressed():
	queue_free()
