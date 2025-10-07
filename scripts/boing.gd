extends StaticBody2D

var cinematic_preload = preload("res://scenes/cinematic.tscn")
var cinematic
var tilemap

func _ready():
	$AnimatedSprite2D.play("idle")
	cinematic = cinematic_preload.instantiate()
	add_child(cinematic)
	tilemap = Globals.tilemap

func _on_dialog_body_entered(body):
	if body.name == "Player":
		Dialog.show_dialog(1)
		await Dialog.dialog_finished

		Globals.can_play = false

		$AnimatedSprite2D.play("open_fridge")
		await $AnimatedSprite2D.frame_changed
		await $AnimatedSprite2D.frame_changed
		
		tilemap.fill_zone_from_tileset(
			tilemap, 
			Vector2i(9, -8), Vector2i(12, -5),
			Vector2i(7, 4),  Vector2i(10, 7),
			3,
			1)
		
		await $AnimatedSprite2D.frame_changed
		await $AnimatedSprite2D.frame_changed
		$AnimatedSprite2D.play("idle")
		$Dialog.queue_free()
		Dialog.show_dialog(2)
		await Dialog.dialog_finished
		
		Globals.can_play = false
		ScreenFade.fade_in()
		await ScreenFade.fade_finished
		
		Dialog.show_dialog(3)
		await Dialog.dialog_finished
		
		Globals.can_play = false
		ScreenFade.fade_out()
		await ScreenFade.fade_finished
		
		Dialog.show_dialog(4)
		await Dialog.dialog_finished
		
		cinematic.show_cinematic("couch_house")
		
		Dialog.show_dialog(5)
		await Dialog.dialog_finished
		
		cinematic.hide()
		
		Dialog.show_dialog(6)
		await Dialog.dialog_finished
		
		Globals.can_play = false
		
		$AnimatedSprite2D.play("open_fridge")
		await $AnimatedSprite2D.frame_changed
		await $AnimatedSprite2D.frame_changed
		
		tilemap.fill_zone_from_tileset(
			tilemap, 
			Vector2i(9, -8), Vector2i(10, -5),
			Vector2i(5, 4),  Vector2i(6, 7),
			3,
			1)
		
		tilemap.clear_zone(
			tilemap,
			Vector2i(11, -8), Vector2i(12, -5),
			3
		)
		
		await $AnimatedSprite2D.frame_changed
		await $AnimatedSprite2D.frame_changed
		$AnimatedSprite2D.play("idle")
		
		Globals.can_play = true
		
		await go_y(1, 10, 1)
		await go_x(1, 9, 1)
		await go_y(-1, 7, 1)
		teleport(76, 14)
		await go_y(-1, 7)
		await go_x(-1, 10)
		teleport(38, 29)
		await go_x(-1, 10)
		$AnimatedSprite2D.play("idle")

func go_x(x_direction, tile_count, speed = 1):
	var distance = tile_count * 16
	var n = distance / speed
	if x_direction == 1:
		$AnimatedSprite2D.play("walk_right")
	else:
		$AnimatedSprite2D.play("walk_left")
	for i in range(n):
		position.x += x_direction * speed
		await get_tree().process_frame

func go_y(y_direction, tile_count, speed = 1):
	var distance = tile_count * 16
	var n = distance / speed
	if y_direction == 1:
		$AnimatedSprite2D.play("walk_down")
	else:
		$AnimatedSprite2D.play("walk_up")
	for i in range(n):
		position.y += y_direction * speed
		await get_tree().process_frame

func teleport(tile_x, tile_y):
	position = Vector2(tile_x, tile_y) * 16
