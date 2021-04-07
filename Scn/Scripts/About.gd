extends Control

signal Done

func _on_Close_pressed():
	queue_free()
	emit_signal("Done")

func _on_Erase_pressed():
	FileUser.Clear()
	emit_signal("Done")
