extends Node3D

enum GateType { AND, OR, NOT }

signal output_changed(is_on: bool)

@export var gate_type: GateType = GateType.AND

@onready var switch_a = $SwitchA
@onready var switch_b = $SwitchB
@onready var lamp = $Lamp

func _ready() -> void:
	switch_a.switched.connect(_on_switch_changed)
	switch_b.switched.connect(_on_switch_changed)
	if gate_type == GateType.NOT:
		switch_b.visible = false
		switch_b.monitoring = false
		switch_a.position.x = 0
	_on_switch_changed(false)

func _on_switch_changed(_is_on: bool) -> void:
	var a: bool = switch_a.is_on
	var b: bool = switch_b.is_on
	var result: bool
	match gate_type:
		GateType.AND:
			result = a and b
		GateType.OR:
			result = a or b
		GateType.NOT:
			result = not a
	lamp.set_on(result)
	output_changed.emit(result)
