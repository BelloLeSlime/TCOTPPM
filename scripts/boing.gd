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
