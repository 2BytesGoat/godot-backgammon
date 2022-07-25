extends Node2D

const MIN_ROLLS = 5
const MAX_ROLLS = 10

onready var die_sprite = get_node("DieSprite") 
onready var timer = get_node("Timer")
onready var max_die_faces = die_sprite.hframes

signal done_rolling

func roll_die():
	for _i in range(max(MIN_ROLLS, randi() % MAX_ROLLS)):
		die_sprite.frame = randi() % max_die_faces
		timer.start()
		yield(timer, "timeout")
	emit_signal("done_rolling", die_sprite.frame + 1)

func get_value():
	return die_sprite.frame + 1
