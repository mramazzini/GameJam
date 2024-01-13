extends TileMap

var currentLevel:String
var inBuilding:bool
var floor:int

func setFloor(level:int):
	print(level)
	set_layer_z_index(floor,0)
	floor = level
	set_layer_z_index(floor,1)
	print(get_layer_z_index(0), get_layer_z_index(1))
	get_tree().get_first_node_in_group("player").z_index = floor +1

func setInBuilding(b:bool):
	inBuilding = b
