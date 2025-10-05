extends StaticBody2D

const speed = 200
signal crash_car

func _process(delta):
	position.x += speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("crash_car")
