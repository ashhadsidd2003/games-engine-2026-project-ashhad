extends Node3D

signal solved

@export var target_output: bool = true

@onready var gate = $Gate
@onready var door = $Door

func _ready() -> void:
	gate.output_changed.connect(_on_gate_output_changed)

func _on_gate_output_changed(is_on: bool) -> void:
	if is_on == target_output and not door.is_open:
		door.open()
		solved.emit()
