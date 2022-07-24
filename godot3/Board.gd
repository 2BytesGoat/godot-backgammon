extends Node2D

var CHECKERS_FORMATION = []
onready var checkers_spaces = get_node("Checkers")

onready var player_1_tile = checkers_spaces.tile_set.find_tile_by_name("player_1")
onready var player_2_tile = checkers_spaces.tile_set.find_tile_by_name("player_2")

func _ready():
	add_checkers(GameMeta.meta['player_1_init'], player_1_tile)
	add_checkers(GameMeta.meta['player_2_init'], player_2_tile)

func add_checkers(positions: Array, tile: int):
	for pos in positions:
		checkers_spaces.set_cell(pos[0], pos[1], tile)
