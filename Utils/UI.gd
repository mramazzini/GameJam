extends CanvasLayer
class_name UI

var UIDict = {}
var current
func _ready():
	UIDict = FS.loadScenes("res://UI/")
	setUI("MainMenu")

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		Utils.toggleMouse()
	
func setUI(UIName: String):
	if UIName == "none":
		if current:
			current.queue_free()
			current = null
			Utils.mouseCapture()
		return
	var newUI:PackedScene = UIDict[UIName]
	if newUI:
		if current:
			current.queue_free()
		current = newUI.instantiate()
		add_child(current)
		Utils.mouseVisible()
	else:
		push_error("PackedScene ", UIName, " does not exist.")
