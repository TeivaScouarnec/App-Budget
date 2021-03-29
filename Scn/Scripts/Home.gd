extends Control

var SoldAmount : Label
var ExpenseAmount : SpinBox
var History : RichTextLabel

func _ready():
	FileUser.Load_File()
	
	SoldAmount = get_node("Solde/Amount")
	ExpenseAmount = get_node("Fast Expense/Amount")
	History = get_node("History/Text")
	
	Functions.Balance()
	SoldAmount.text = ""
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	
	History.clear()
	History.text = str(Functions.SetHistory())
	

func _on_Add_pressed():
	Functions.Add_Expense("Dépense Rapide",ExpenseAmount.value)
	Functions.Balance()
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	ExpenseAmount.value = 0
	History.clear()
	History.text = str(Functions.SetHistory())

func _on_RecipeScn_pressed():
	var RecipeScnLoad = preload("res://Scn/Recipe.tscn")
	var RecipeScnNew = RecipeScnLoad.instance()
	add_child(RecipeScnNew)
	RecipeScnNew.connect("Done",self,"Update")
	
func Update():
	print ("Emit")
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	
	History.clear()
	History.text = str(Functions.SetHistory())

func _on_Clear_pressed():
	FileUser.Clear()
	Functions.Balance()
	SoldAmount.text = ""
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	
	History.clear()
	History.text = str(Functions.SetHistory())

func _on_ExpenseScn_pressed():
	var ScnLoad = preload("res://Scn/Expense.tscn")
	var ScnNew = ScnLoad.instance()
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")

func _on_About_pressed():
	var ScnLoad = preload("res://Scn/About.tscn")
	var ScnNew = ScnLoad.instance()
	add_child(ScnNew)
