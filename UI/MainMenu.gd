extends Control

@onready var play = $MarginContainer/CenterContainer/HBoxContainer/Play
@onready var settings = $MarginContainer/CenterContainer/HBoxContainer/Settings

func _ready():
	play.pressed.connect(goTo.bind("LevelSelect"))
	
func goTo(uiName:String):
	get_tree().get_first_node_in_group("UI").setUI(uiName)
