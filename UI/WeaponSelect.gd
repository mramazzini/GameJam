extends MarginContainer

@onready var hose := $Panel/MarginContainer/VBoxContainer/Buttons/HoseSelect
@onready var extinguisher:= $Panel/MarginContainer/VBoxContainer/Buttons/ExtinguisherSelect
@onready var axe:= $Panel/MarginContainer/VBoxContainer/Buttons/AxeSelect
@onready var player:Player = get_tree().get_first_node_in_group("player")



func _ready():
	hose.pressed.connect(setWeapon.bind(Utils.weapons.HOSE))
	extinguisher.pressed.connect(setWeapon.bind(Utils.weapons.EXTINGUISHER))
	axe.pressed.connect(setWeapon.bind(Utils.weapons.AXE))


func setWeapon(weapon:Utils.weapons):
	player.setWeapon(weapon)
	get_tree().get_first_node_in_group("UI").setUI("Overlay")
