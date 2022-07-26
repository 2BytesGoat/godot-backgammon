extends TileMap

var pattern_up_tile_idx = 0
var pattern_down_tile_idx = 1
var checker_tile_idx = 2

func highlight_checker_cell(pos):
	self.set_cellv(pos, checker_tile_idx)

func highlight_pattern_cell(pos):
	self.set_cellv(pos, pattern_up_tile_idx)
