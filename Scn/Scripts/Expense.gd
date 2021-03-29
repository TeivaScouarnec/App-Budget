extends Control

var SoldAmount : Label
var ExpenseAmount : Label
var ExpenseHistory : RichTextLabel
var ExpenseName : LineEdit
var ExpenseValue : SpinBox

signal Done

func _ready():
	SoldAmount = get_node("Sold/Amount")
	ExpenseAmount = get_node("Expense/Amount")
	ExpenseHistory = get_node("ExpenseHistory/Text")
	ExpenseName = get_node("ExpensePanel/Text")
	ExpenseValue = get_node("ExpensePanel/Amount")
	
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	ExpenseAmount.text = str(FileUser.Expense_Value) + "EUR"
	
	ExpenseHistory.text = str(Functions.SetExpenseHistory())


func _on_Add_pressed():
	if ExpenseName.text == "":
		ExpenseName.text = "Dépense"
	Functions.Add_Expense(ExpenseName.text,ExpenseValue.value)
	Functions.Balance()
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	ExpenseAmount.text = str(FileUser.Expense_Value) + "EUR"
	ExpenseHistory.text = str(Functions.SetExpenseHistory())
	ExpenseName.clear()
	emit_signal("Done")


func _on_Remove_pressed():
	if ExpenseName.text == "":
		ExpenseName.text = "Recette"
	Functions.Remove_Expense(ExpenseName.text,ExpenseValue.value)
	Functions.Balance()
	SoldAmount.text = str(FileUser.Balance_Value) + "EUR"
	ExpenseAmount.text = str(FileUser.Expense_Value) + "EUR"
	ExpenseHistory.text = str(Functions.SetExpenseHistory())
	ExpenseName.clear()
	emit_signal("Done")

func _on_Close_pressed():
	queue_free()
