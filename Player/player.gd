extends CharacterBody2D
class_name Player
@onready var Health = $Health
enum weapons {NONE,HOSE,EXTINGUISHER,AXE}
var weapon:weapons = weapons.NONE
const speed = 30000.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed * delta

	move_and_slide()

