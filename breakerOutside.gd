extends Area2D
class_name Breaker



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("e"):
		get_tree().get_first_node_in_group("UI").setUI("Breaker")


func _on_body_exited(body):
	get_tree().get_first_node_in_group("UI").setUI("Overlay")
