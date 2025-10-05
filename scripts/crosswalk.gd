extends Node2D

func _on_area_2d_body_entered(body: Node2D):
	if body.name == "Player":
		print("cross enterred")
		Globals.is_touching_crosswalk = true

func _on_area_2d_body_exited(body: Node2D):
	if body.name == "Player":
		print("cross exited")
		Globals.is_touching_crosswalk = false
