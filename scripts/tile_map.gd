extends TileMap

var tileset = tile_set

func fill_zone_from_tileset(tilemap: TileMap, 
		map_start: Vector2i, map_end: Vector2i,
		set_start: Vector2i, set_end: Vector2i,
		layer: int,
		source_id: int):
	var map_size = (map_end - map_start) + Vector2i(1, 1)
	var set_size = (set_end - set_start) + Vector2i(1, 1)
	
	if map_size != set_size:
		push_error("Erreur: la zone du TileMap et du TileSet n'ont pas la même taille.")
		return

	for x in range(set_size.x):
		for y in range(set_size.y):
			var dst_pos = map_start + Vector2i(x, y)
			var atlas_coords = set_start + Vector2i(x, y)
			tilemap.set_cell(layer, dst_pos, source_id, atlas_coords)


func clear_zone(
		tilemap: TileMap,
		map_start: Vector2i, map_end: Vector2i,
		layer: int = 0
	) -> void:
	
	var size = (map_end - map_start) + Vector2i(1, 1)
	
	for x in range(size.x):
		for y in range(size.y):
			var dst_pos = map_start + Vector2i(x, y)
			tilemap.set_cell(layer, dst_pos, -1) # -1 = vide
