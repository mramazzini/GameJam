extends Area2D

@export var floor = 1
func _on_player_entered(body):
	get_tree().get_first_node_in_group("world").floor = floor
	print(get_tree().get_first_node_in_group("world").floor )
