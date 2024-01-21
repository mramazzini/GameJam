extends Node2D
class_name FireStarter

enum type {GREASE, WOOD, ELECTRIC}
var CELL_SIZE = 64
@export var worldCoordinates:Vector2 = Vector2(-10,0)
@export var spreadRate:float = 1
@export var fireType:type= type.GREASE
@onready var level:TileMap = get_tree().get_first_node_in_group("level")
@onready var timer:= $Timer
var fireLight = preload("res://LevelAssets/fireLight.tscn")
var fireNoise = preload("res://LevelAssets/fireNoise.tscn")
var fires = []
var fireState= {}
var noises = {}
var fireInstance:PointLight2D
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(timerTimeout)
	timer.start(spreadRate)
	#initialize fireState
	for x in range(-50,50):
		for y in range(-50,50):
			fireState[Vector2i(x,y)]= false

	fireInstance= fireLight.instantiate()
	level.add_child.call_deferred(fireInstance)
	fireInstance.position = Vector2(worldCoordinates.x+0.5,worldCoordinates.y+0.5) * 64
	spreadFire(worldCoordinates.x, worldCoordinates.y)
func spreadFire(x,y):

	if x < -50 or x >= 50 or y < -50 or y >= 50:
		return
	if not fireState[Vector2i(x,y)]:
		level.set_cell(0,Vector2i(x,y),100,Vector2i(0,0))
		fires.push_front(Vector2i(x, y))
		fireState[Vector2i(x,y)]= true
		fireInstance.scale+=Vector2(0.03125,0.03125)

		fireInstance.energy+0.01
		var noiseInstance = fireNoise.instantiate()
		level.add_child.call_deferred(noiseInstance)
		noiseInstance.position = Vector2(x+0.5,y+0.5) * 64
		noises[Vector2i(x,y)] = noiseInstance

func clearFire(x,y):
	if fireState[Vector2i(x,y)]:
		level.set_cell(0,Vector2i(x,y),2,Vector2i(0,0))
		fires.remove_at(fires.find(Vector2i(x,y)))
		if is_instance_valid(noises[Vector2i(x,y)]):
			noises[Vector2i(x,y)].queue_free()

func getFlammable(x,y):
	var cell = Vector2i(x,y)
	var data = level.get_cell_tile_data(0,Vector2i(x,y))
	if !data: 
		return false
	return data.get_custom_data("flammable")

func timerTimeout():
	var fireDup= fires.duplicate()
	for fire in fireDup:
		if getFlammable(fire.x+1, fire.y):
			spreadFire(fire.x+1, fire.y)
		if getFlammable(fire.x-1, fire.y):
			spreadFire(fire.x-1, fire.y)
		if getFlammable(fire.x, fire.y+1):
			spreadFire(fire.x, fire.y+1)
		if getFlammable(fire.x, fire.y-1):
			spreadFire(fire.x, fire.y-1)
	timer.start(spreadRate)



