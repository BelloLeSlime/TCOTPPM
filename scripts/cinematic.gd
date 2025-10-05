extends CanvasLayer

func _ready():
	hide()

func show_cinematic(cinematic):
	$TextureRect.texture = load("res://assets/cinematics/" + cinematic + ".png")
	show()
