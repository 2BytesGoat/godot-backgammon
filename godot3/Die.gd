extends Node2D

onready var die_sprite = get_node("DieSprite") 
onready var timer = get_node("Timer")
onready var max_die_faces = die_sprite.hframes

signal done_rolling

func _ready():
	randomize()

func roll_die():
	for _i in range(10):
		die_sprite.frame = randi() % max_die_faces
		timer.start()
		yield(timer, "timeout")
	emit_signal("done_rolling", die_sprite.frame + 1)

func get_value():
	return die_sprite.frame + 1
