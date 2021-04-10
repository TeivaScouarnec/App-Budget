extends Control

enum TYPES {RECIPE, EXPENSE, NULL}
export (TYPES) var NameType = TYPES.NULL

var NameNode
var DateNode
var AmountNode

signal Done

func _ready():
	NameNode = get_node("Name")
	DateNode = get_node("Date")
	AmountNode = get_node("Amount")

func Update():
	NameNode.NameUpdate()
	
func _on_Add_pressed():
	var Name = NameNode.GetName()
	print (Name)
	var Amount = AmountNode.GetAmount()
	print (Amount)
	var Day = DateNode.GetDay()
	print (Day)
	var Month = DateNode.GetMonth()
	print (Month)
	var Year = DateNode.GetYear()
	print (Year)
	
	if Name==null||Amount==null||Day==null||Month==null||Year==null:
		return
		
	match NameType:
		TYPES.RECIPE:
			Functions.AddRecipe(Name,Amount,Day,Month,Year)
		TYPES.EXPENSE:
			Functions.AddExpense(Name,Amount,Day,Month,Year)
	emit_signal("Done")

func _on_Undo_pressed():
	pass # Replace with function body.
