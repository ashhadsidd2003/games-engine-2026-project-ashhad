extends Node3D

@onready var player = $XROrigin3D

var rooms: Array = []
var current_room := 0

func _ready() -> void:
	rooms = [$Room1, $Room2, $Room3]
	for room in rooms:
		room.solved.connect(_on_room_solved)

func _on_room_solved() -> void:
	await get_tree().create_timer(2.0).timeout
	current_room += 1
	if current_room < rooms.size():
		player.global_position = rooms[current_room].global_position
