extends Control

var SoldAmount : Label
var ExpenseAmount : LineEdit

signal Done

func _ready():
	FileUser.Load_File()
	SoldAmount = get_node("Solde/Amount")
	ExpenseAmount = get_node("Fast Expense/Amount")
	Functions.Balance()
	SoldAmount.text = ""
	SoldAmount.text = str(FileUser.BalanceValue) + "EUR"
	emit_signal("Done")
	
func _on_Add_pressed():
	Functions.AddExpense("Dépense Rapide", ExpenseAmount.CheckText())
	Functions.Balance()
	SoldAmount.text = str(FileUser.BalanceValue) + "EUR"
	ExpenseAmount.text = ""
	emit_signal("Done")

func _on_RecipeScn_pressed():
	var RecipeScnLoad = preload("res://Scn/Recipe.tscn")
	var RecipeScnNew = RecipeScnLoad.instance()
	add_child(RecipeScnNew)
	RecipeScnNew.connect("Done",self,"Update")
	
func Update():
	print ("Emit")
	SoldAmount.text = str(FileUser.BalanceValue) + "EUR"

func _on_ExpenseScn_pressed():
	var ScnLoad = preload("res://Scn/Expense.tscn")
	var ScnNew = ScnLoad.instance()
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")

func _on_About_pressed():
	var ScnLoad = preload("res://Scn/About.tscn")
	var ScnNew = ScnLoad.instance()
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")

