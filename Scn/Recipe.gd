extends LineEdit

var Recipe_Amount : SpinBox
var Recipe_Button : Button
var Interface

func _ready():
	Recipe_Amount = get_node("Recipe_Amount")
	Recipe_Button = get_node("Recipe_Button")
	Interface = get_parent()
	
func _on_Depense_Button_pressed():
	Interface.Add_Recipe(Recipe_Amount.value)


func _on_Money_Button_Remove_pressed():
	Interface.Remove_Recipe(Recipe_Amount.value)
