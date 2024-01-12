extends CanvasLayer
class_name UI

var UIDict = {}
var current
func _ready():
	UIDict = FS.loadScenes("res://UI/")
	setUI("MainMenu")

	
func setUI(UIName: String):
	if UIName == "none":
		if current:
			current.queue_free()
			current = null
		return
	var newUI:PackedScene = UIDict[UIName]
	if newUI:
		if current:
			current.queue_free()
		current = newUI.instantiate()
		add_child(current)
	else:
		push_error("PackedScene ", UIName, " does not exist.")
