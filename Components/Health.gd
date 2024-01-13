extends Node2D
class_name HealthComponent
@export var HP: float = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage(amount:float):
	HP -= amount
func heal(amount:float):
	HP += amount
