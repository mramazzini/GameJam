extends TileMap

var currentLevel:String
var inBuilding:bool
var floor:int
@onready var lights:=$Lights
@onready var floors = {
	0:$Floor0,
	1:$Floor1
}
func setFloor(level:int):

	set_layer_z_index(floor,0)
	floor = level
	set_layer_z_index(floor,1)

	get_tree().get_first_node_in_group("player").z_index = floor +1
	for area in floors[floor].get_children() as Array[DoorBoundary]:
		area.monitoring = true if floor == 0 else false

func setInBuilding(b:bool):
	inBuilding = b
	
