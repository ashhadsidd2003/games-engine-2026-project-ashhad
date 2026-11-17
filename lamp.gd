extends Node3D

func _ready() -> void:
	set_on(false)

func set_on(on: bool) -> void:
	var material := StandardMaterial3D.new()
	if on:
		material.albedo_color = Color.YELLOW
		material.emission_enabled = true
		material.emission = Color.YELLOW
	else:
		material.albedo_color = Color.DIM_GRAY
	$MeshInstance3D.material_override = material
