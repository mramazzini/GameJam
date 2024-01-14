extends MarginContainer

@onready var hose := $Panel/MarginContainer/VBoxContainer/Buttons/HoseSelect
@onready var extinguisher:= $Panel/MarginContainer/VBoxContainer/Buttons/ExtinguisherSelect
@onready var axe:= $Panel/MarginContainer/VBoxContainer/Buttons/AxeSelect
@onready var player:Player = get_tree().get_first_node_in_group("player")
enum weapons{NONE,HOSE,EXTINGUISHER,AXE}


func _ready():
	hose.pressed.connect(setWeapon.bind(weapons.HOSE))
	extinguisher.pressed.connect(setWeapon.bind(weapons.EXTINGUISHER))
	axe.pressed.connect(setWeapon.bind(weapons.AXE))


func setWeapon(weapon):
	player.weapon = weapon
	get_tree().get_first_node_in_group("UI").setUI("none")
