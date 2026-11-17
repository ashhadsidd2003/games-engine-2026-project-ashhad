extends Node3D

@onready var switch_a = $SwitchA
@onready var switch_b = $SwitchB
@onready var lamp = $Lamp

func _ready() -> void:
	switch_a.switched.connect(_on_switch_changed)
	switch_b.switched.connect(_on_switch_changed)

func _on_switch_changed(_is_on: bool) -> void:
	var result: bool = switch_a.is_on and switch_b.is_on
	lamp.set_on(result)
