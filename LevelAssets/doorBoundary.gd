extends Area2D
@export var isEntry = true

func _on_player_entered(body):
	get_tree().get_first_node_in_group("world").inBuilding = isEntry
	print(get_tree().get_first_node_in_group("world").inBuilding )
