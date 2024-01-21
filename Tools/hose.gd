extends Node2D

var player:Player
var followingPlayer = false
var segments = []
@onready var base = $Base
@onready var playerConnecter := $PlayerConnector
var segment = preload("res://Tools/hoseSegment.tscn")
var LENGTH = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	player.weaponSelected.connect(activate)

func _physics_process(delta):
	if !followingPlayer:
		return

	var p :RigidBody2D= $HoseSegment
	var p2:PinJoint2D=$PinJoint2D
	player.freeze = false
	print(abs(p.position.distance_to(p2.position)) )
	if abs(80-p.position.distance_to(p2.position)) > 1:
		player.freeze = true 
		player.position += delta * player.speed * player.global_position.direction_to(playerConnecter.global_position)
	playerConnecter.node_a = player.get_path()
	

func activate(weapon:Utils.weapons):
	if weapon == Utils.weapons.HOSE:
		followingPlayer = true
		visible = true

func deactivate():
	followingPlayer = false

