extends Node2D

var foam = preload("res://Tools/foam.tscn")
var player:Player
var followingPlayer = false
func _ready():
	player = get_tree().get_first_node_in_group("player")
	player.weaponSelected.connect(activate)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if followingPlayer:
		global_position = player.global_position
		if Input.is_action_pressed("fire"):
			var instance = foam.instantiate()

			instance.direction = player.global_position.direction_to(get_global_mouse_position()) +Vector2(1.0,1.0) * (randf()*2-1)/5

			add_child(instance)

func activate(weapon:Utils.weapons):
	visible = true
	if weapon == Utils.weapons.EXTINGUISHER:
		followingPlayer = true

func deactivate():
	followingPlayer = false
