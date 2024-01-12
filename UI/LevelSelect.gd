extends Control
@onready var Levels = $CenterContainer/Levels
var levelDict
# Called when the node enters the scene tree for the first time.
func _ready():
	levelDict = FS.loadScenes("res://Levels/")
	for level in levelDict.keys():
		var button = Button.new()
		button.text = level
		button.pressed.connect(openLevel.bind(level))
		Levels.add_child(button)

func openLevel(level:String):
	var levelInstance = levelDict[level].instantiate()
	var world = get_tree().get_first_node_in_group("world")
	world.add_child(levelInstance)
	world.currentLevel = level
	get_tree().get_first_node_in_group("UI").setUI("none")
