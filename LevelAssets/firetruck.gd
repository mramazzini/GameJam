extends Area2D

var playerNearby = false
func _ready():
	body_entered.connect(playerEntered)
	body_exited.connect(playerExited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("e") && playerNearby:
		get_tree().get_first_node_in_group("UI").setUI("WeaponSelect")
		

func playerEntered(player):
	playerNearby = true
	
func playerExited(player):
	playerNearby= false
	get_tree().get_first_node_in_group("UI").setUI("Overlay")
