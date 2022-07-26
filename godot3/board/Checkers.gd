extends TileMap

var last_clicked_piece = {
	'position': Vector2.ZERO,
	'value': -1
}

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		var mouse_pos = self.get_local_mouse_position()
		var cell_pos = world_to_map(mouse_pos)
		var cell_value = get_cellv(cell_pos)
		last_clicked_piece = {
			'position': cell_pos,
			'value': cell_value
		}
