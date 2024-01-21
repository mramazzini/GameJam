extends Area2D
class_name Foam

var direction:Vector2
var speed = 1000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position+= direction*speed*delta



func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):

	var level:TileMap = get_tree().get_first_node_in_group("level")
	level.set_cell(0,floor(global_position/64),2,Vector2(0,0))
	var pos = floor(global_position/64)
	get_tree().get_first_node_in_group("fire").clearFire(pos.x,pos.y)
	queue_free()
