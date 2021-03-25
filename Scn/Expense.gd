extends LineEdit

var Expense_Amount : SpinBox
var Expense_Button : Button
var Interface

func _ready():
	Expense_Amount = get_node("Expense_Amount")
	Expense_Button = get_node("Expense_Button")
	Interface = get_parent()
	
func _on_Depense_Button_pressed():
	Interface.Add_Expense(Expense_Amount.value)

func _on_Depense_Button_Remove_pressed():
	Interface.Remove_Expense(Expense_Amount.value)
