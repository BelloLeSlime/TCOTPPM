extends Node2D

var cinematic_preload = preload("res://scenes/cinematic.tscn")
var cinematic
var cinematic_index = 0
var cinematic_images = [
	"git_gud",
	"bulip",
	"discord",
	"cursed"
]

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Globals.can_play = false
	cinematic = cinematic_preload.instantiate()
	add_child(cinematic)
	Globals.tilemap = $TileMap
	
	cinematic.show_cinematic(cinematic_images[cinematic_index])

func _input(_event):
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()
	if Input.is_action_just_pressed("e"):
		if not cinematic_index == len(cinematic_images) - 1 and cinematic_index != -1:
			cinematic_index += 1
			cinematic.show_cinematic(cinematic_images[cinematic_index])
		elif not cinematic_index == -1:
			cinematic.hide()
			Dialog.show_dialog(0)
			cinematic_index = -1
