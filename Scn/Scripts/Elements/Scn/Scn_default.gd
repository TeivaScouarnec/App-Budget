extends Control

enum TYPES {RECIPE, EXPENSE, GLOBAL, NULL}
export (TYPES) var Scn

var BoxButton
var History

signal Done

func _ready():
	BoxButton = get_node("Button_Name")
	History = get_node("History")
	BoxButton.connect("Done",self,"Update")

	match Scn:
		TYPES.RECIPE:
			BoxButton.NameType = BoxButton.TYPES.RECIPE
			History.HistoryType =  History.TYPES.RECIPE
		TYPES.EXPENSE:
			BoxButton.NameType = BoxButton.TYPES.EXPENSE
			History.HistoryType = History.TYPES.EXPENSE
	Update()

func Update():
	History.HistoryUpdate()
	BoxButton.Update()
	print ("History update!")

func _on_Close_pressed():
	queue_free()
	emit_signal("Done")
