extends Control

var CurrentSoldAmount : Label
var ForecastSoldAmount : Label
var ExpenseAmount : LineEdit

signal Done

func _ready():
	FileUser.Load_File()
	CurrentSoldAmount = get_node("Solde/CurrentAmount")
	ForecastSoldAmount = get_node("Solde/ForecastAmount")
	ForecastSoldAmount.text = str(Functions.ForecastBalance()) + "EUR"
	CurrentSoldAmount.text = str(Functions.Balance()) + "EUR"
	emit_signal("Done")
	
func _on_Add_pressed():
	pass

func _on_RecipeScn_pressed():
	var ScnLoad = preload("res://Scn/Scn_default.tscn")
	var ScnNew = ScnLoad.instance()
	ScnNew.Scn = ScnNew.TYPES.RECIPE
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")
	
func Update():
	print ("Emit")
	ForecastSoldAmount.text = str(Functions.ForecastBalance()) + "EUR"
	CurrentSoldAmount.text = str(Functions.Balance()) + "EUR"
	emit_signal("Done")
	FileUser.Save_File()

func _on_ExpenseScn_pressed():
	var ScnLoad = preload("res://Scn/Scn_default.tscn")
	var ScnNew = ScnLoad.instance()
	ScnNew.Scn = ScnNew.TYPES.EXPENSE
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")

func _on_About_pressed():
	var ScnLoad = preload("res://Scn/About.tscn")
	var ScnNew = ScnLoad.instance()
	add_child(ScnNew)
	ScnNew.connect("Done",self,"Update")

