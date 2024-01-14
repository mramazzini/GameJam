extends Area2D
class_name DoorBoundary
@export var isEntry = true
@export var floor = 0
func _on_player_entered(body):
	get_tree().get_first_node_in_group("level").setInBuilding(isEntry)

