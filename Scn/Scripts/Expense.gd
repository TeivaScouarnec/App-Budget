extends Control

var ExpenseHistory : RichTextLabel
var ExpenseName : LineEdit
var ExpenseValue : LineEdit
var Undo : bool

signal Done

func _ready():
	Undo = false
	ExpenseHistory = get_node("ExpenseHistory/Text")
	ExpenseName = get_node("ExpensePanel/Amount")
	ExpenseValue = get_node("ExpensePanel/Amount")
	
	ExpenseHistory.text = str(Functions.SetExpenseHistory())

func _on_Add_pressed():
	if ExpenseName.text == "":
		ExpenseName.text = "Dépense"
	Functions.Add_Expense(ExpenseName.text,ExpenseValue.CheckText())
	Functions.Balance()
	ExpenseHistory.text = str(Functions.SetExpenseHistory())
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
		Functions.Remove_Expense()
		ExpenseHistory.clear()
		ExpenseHistory.text = str(Functions.SetExpenseHistory())
		Functions.Balance()
		emit_signal("Done")
		Undo = false
	else:
		print ("No")
