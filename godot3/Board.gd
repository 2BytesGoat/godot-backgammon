extends Node2D

var board = {}

onready var checkers_tilemap = get_node("Checkers")

onready var checker_tiles = [
	checkers_tilemap.tile_set.find_tile_by_name("player_1"),
	checkers_tilemap.tile_set.find_tile_by_name("player_2")
]

func _ready():
	print(checkers_tilemap.get_used_cells())
	_init_board_space()
	add_checkers(GameMeta.meta["player_1_init"], 0)
	add_checkers(GameMeta.meta["player_2_init"], 1)

func _init_board_space():
	var total_columns = GameMeta.meta["board_info"]["total_columns"]
	for col_idx in range(total_columns):
		board[col_idx] = {0: 0, 1: 0}

func add_checkers(groups: Array, tile_idx: int):
	for group in groups:
		var col_idx = int(group[0])
		var checker_count = int(group[1])
		board[col_idx][tile_idx] = checker_count
		for row_idx in range(checker_count):
			place_piece_on_board(col_idx, row_idx, tile_idx)

func place_piece_on_board(col_idx, row_idx, tile_idx):
	var cols_per_sector = int(GameMeta.meta["board_info"]["columns_per_sector"])
	var sector_idx = ceil(col_idx / cols_per_sector)
	
	var step_x = GameMeta.meta["board_info"]["step_x"]
	var step_y = GameMeta.meta["board_info"]["step_y"]
	var sector_info = GameMeta.meta["sector_" + str(sector_idx)]
	
	var direction_x = sector_info["direction_x"]
	var direction_y = sector_info["direction_y"]
	var sector_corners = sector_info["corners"]
	
	var x_pos = sector_corners[0][0] + (col_idx % cols_per_sector) * step_x * direction_x
	var y_pos = sector_corners[0][1] + row_idx * step_y * direction_y
	
	if sector_idx in [0, 1] and (x_pos < sector_corners[1][0] or y_pos < sector_corners[1][1]):
		return
	elif sector_idx in [2, 3] and (x_pos > sector_corners[1][0] or y_pos > sector_corners[1][1]):
		return
	var tile = checker_tiles[tile_idx]
	checkers_tilemap.set_cell(x_pos, y_pos, tile)
