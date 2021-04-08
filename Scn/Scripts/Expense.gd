extends Control

var ExpenseName : LineEdit
var ExpenseValue : LineEdit
var Undo : bool

signal Done

func _ready():
	Undo = false
	ExpenseName = get_node("ExpensePanel/Name")
	ExpenseValue = get_node("ExpensePanel/Amount")
	emit_signal("Done")

func _on_Add_pressed():
	if ExpenseName.text == "":
		ExpenseName.text = "Dépense"
	Functions.AddExpense(ExpenseName.text,ExpenseValue.CheckText())
	Functions.Balance()
	ExpenseName.clear()
	ExpenseName.text = ""
	ExpenseValue.clear()
	ExpenseValue.text = ""
	emit_signal("Done")
	Undo = true

func _on_Close_pressed():
	queue_free()

func _on_Undo_pressed():
	if Undo == true:
		Functions.RemoveExpense()
		Functions.Balance()
		emit_signal("Done")
		Undo = false
	else:
		print ("No")
