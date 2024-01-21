extends Area2D
class_name FireLight



func _on_body_entered(body):
	get_tree().get_first_node_in_group("sound").addFire(self)
	



func _on_body_exited(body):
	get_tree().get_first_node_in_group("sound").removeFire(self)
