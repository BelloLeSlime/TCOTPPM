extends Node2D

func _on_area_2d_body_entered(body: Node2D):
	if body.name == "Player":
		Globals.is_touching_road = true

func _on_area_2d_body_exited(body: Node2D):
	if body.name == "Player":
		Globals.is_touching_road = false
