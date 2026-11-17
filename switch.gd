extends Area3D

signal switched(is_on: bool)

var is_on := false

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	_update_colour()

func _on_area_entered(area: Area3D) -> void:
	if not area.is_in_group("finger_tip"):
		return
	is_on = not is_on
	_update_colour()
	switched.emit(is_on)

func _update_colour() -> void:
	var material := StandardMaterial3D.new()
	if is_on:
		material.albedo_color = Color.GREEN
	else:
		material.albedo_color = Color.RED
	$MeshInstance3D.material_override = material
