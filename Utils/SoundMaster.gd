extends Node2D

var nearbyFires = []
@onready var fireSound:=$Fire
var nearestFire


func calcNearbyFire():
	var player:Player = get_tree().get_first_node_in_group("player")
	nearestFire = nearbyFires[0]
	for f in nearbyFires:
		if player.global_position.distance_to(f.global_position) > player.global_position.distance_to(nearestFire.global_position):
			nearestFire = f

func addFire(fire):
	nearbyFires.append(fire)
	calcNearbyFire()

func removeFire(fire):
	nearbyFires.remove_at(nearbyFires.find(fire))
	if nearbyFires.size() == 0:
		return
	calcNearbyFire()
	
func _process(delta):
	if nearbyFires.size() != 0:
		fireSound.global_position = nearestFire.global_position
		if !fireSound.playing:
			fireSound.play()
	else:
		fireSound.stop()
