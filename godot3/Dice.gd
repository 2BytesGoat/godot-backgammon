extends Node2D

onready var dice = [
	get_node("Die1"),
	get_node("Die2")
]

func _on_DiceRollbox_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("left_click"):
		for die in dice:
			die.roll_die()

func get_values():
	var values = []
	for die in dice:
		values.append(die.get_value())
	return values
