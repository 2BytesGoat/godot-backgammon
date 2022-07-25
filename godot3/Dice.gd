extends Node2D

onready var dice_rollbox = get_node("DiceRollbox")

var dice_objects = []
var dice_value = []

signal dice_done_rolling

func _ready():
	for child in get_children():
		if 'Die' in child.name: dice_objects.append(child)
	
	for die in dice_objects:
		die.connect("done_rolling", self, "_on_Die_done_rolling")

func _on_DiceRollbox_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("left_click"):
		dice_rollbox.input_pickable = false
		for die in dice_objects:
			die.roll_die()

func _on_Die_done_rolling(val):
	dice_value.append(val)
	if len(dice_value) == len(dice_objects):
		emit_signal("dice_done_rolling")

