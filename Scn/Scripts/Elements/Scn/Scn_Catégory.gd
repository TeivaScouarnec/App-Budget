extends Control

var CategoryList : ItemList

func _ready():
	CategoryList = get_node("List")
	
	CategoryList.add_item("Test1")
	CategoryList.add_item("Test2")
	CategoryList.add_item("Test3")
