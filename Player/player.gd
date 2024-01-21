extends CharacterBody2D
class_name Player
@onready var Health = $Health
var freeze = false
var weapon:Utils.weapons = Utils.weapons.NONE
const speed = 300.0
signal weaponSelected(weapon:Utils.weapons)
func setWeapon(w:Utils.weapons):
	weapon = w
	weaponSelected.emit(w)

func _physics_process(delta):
	if freeze:
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position  += direction * speed * delta


