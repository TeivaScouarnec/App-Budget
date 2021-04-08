extends Control

var Day
var Mouth
var Year

func _ready():
	Day = get_node("Day").text
	Mouth = get_node("Mouth").text
	Year = get_node("Year").text

func GetDate():
	if !Day == "":
		OnlyDigits(Day)
	if !Mouth == "":
		OnlyDigits(Mouth)
	if !Year == "":
		OnlyDigits(Year)
	
	var Date = ("")
func OnlyDigits(amount : String):
	for e in amount:
		if "0123456789,.".find(e) == -1:
			return ""
	return amount
