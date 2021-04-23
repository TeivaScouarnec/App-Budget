extends Control

var Value

func _ready():
	Value = get_node("Value")
	
func GetAmount():
	var amount
	
	if !Value.text == "":
		Value.text = OnlyDigits(Value.text)
		if "," in Value.text:
			Value.text = Value.text.replace(",",".")
		amount = Value.text.to_float()
	else:
		return
	
	if !amount == null:
		amount = stepify(amount,0.001)
		return amount
	else:
		return
		
	print ("Montant: " + str(amount))
	
func OnlyDigits(amount : String):
	for e in amount:
		if "0123456789,.".find(e) == -1:
			return ""
	return amount

func AmountUpdate():
	Value.text = ""
