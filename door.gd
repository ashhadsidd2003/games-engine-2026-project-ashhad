extends Node3D

var is_open := false

func open() -> void:
	if is_open:
		return
	is_open = true
	var tween := create_tween()
	tween.tween_property($MeshInstance3D, "position:y", 3.0, 1.0)
	

func on_gate_changed(is_on: bool) -> void:
	if is_on:
		open()
