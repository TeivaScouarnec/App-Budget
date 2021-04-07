extends LineEdit

func CheckText():
	var TextEnter = OnlyDigits()
	if "," in TextEnter:
		TextEnter = text.replace(",",".")
	return TextEnter.to_float()
	
func OnlyDigits():
	for e in text:
		if "0123456789,.".find(e) == -1:
			return ""
	return text
