extends Control

var NodeParent
var NodeHistory
signal Done

func _ready():
	NodeParent = get_parent()
	NodeHistory = NodeParent.get_node("History")
	connect("Done",NodeHistory,"HistoryUpdate")

func _on_Close_pressed():
	emit_signal("Done")
	queue_free()
	

func _on_Erase_pressed():
	FileUser.Clear()
	emit_signal("Done")
