extends Node3D

@export var title: String = "ROOM"
@export_multiline var instructions: String = ""

func _ready() -> void:
	$InfoPanel/Title.text = title
	$InfoPanel/Instructions.text = instructions
