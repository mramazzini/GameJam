extends MarginContainer

@onready var weaponText:= $HBoxContainer/VBoxContainer/CurrentWeapon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var weapon = get_tree().get_first_node_in_group("player").weapon
	
	match weapon:
		Utils.weapons.NONE:
			weaponText.text = "Current Tool: None"
		Utils.weapons.HOSE:
			weaponText.text = "Current Tool: Hose"
		Utils.weapons.EXTINGUISHER:
			weaponText.text = "Current Tool: Fire Extinguisher"
		Utils.weapons.AXE:
			weaponText.text = "Current Tool: Fire Axe"

