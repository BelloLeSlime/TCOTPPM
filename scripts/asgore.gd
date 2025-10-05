extends StaticBody2D

const speed = 1
signal crash_car

func _process(_delta):
	position.x += speed

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("crash_car")
