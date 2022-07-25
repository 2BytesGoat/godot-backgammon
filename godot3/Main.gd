extends Node2D

onready var dice = get_node("Dice")

func _on_Dice_dice_done_rolling():
	print(dice.dice_value)
