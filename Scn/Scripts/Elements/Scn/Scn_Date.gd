extends Control

var Day : LineEdit
var Month : LineEdit
var Year : LineEdit

func _ready():
	Day = get_node("Day")
	Month = get_node("Month")
	Year = get_node("Year")
	
	Day.text = str(GetDay())
	Month.text = str(GetMonth())
	Year.text = str(GetYear())

func GetDay():
	var day
	
	if !Day.text == "":
		Day.text = OnlyDigits(Day.text)
		day = Day.text.to_int()
	else:
		day = Functions.GetDateDay()
	
	if day > 32:
		return
	
	print ("Jour: " + str(day))
	return (day)
	Day.text = "Jour"
	
func GetMonth():
	var month
	
	if !Month.text == "":
		Month.text = OnlyDigits(Month.text)
		month = Month.text.to_int()
	else:
		month = Functions.GetDateMonth()
		
	if month > 12:
		return
		
	print ("Mois: " + str(month))
	return (month)
	Month.text = "Mois"
	
func GetYear():
	var year
	
	if !Year.text == "":
		Year.text = OnlyDigits(Year.text)
		year = Year.text.to_int()
	else:
		year = Functions.GetDateYear()
	
	print ("Année: " + str(year))
	return (year)
	Year.text = "Année"

func OnlyDigits(amount : String):
	for e in amount:
		if "0123456789".find(e) == -1:
			return ""
	return amount

