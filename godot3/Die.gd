extends Node2D

onready var die_sprite = get_node("DieSprite") 
onready var timer = get_node("Timer")
onready var max_die_faces = die_sprite.hframes

func roll_die():
	for _i in range(5):
		die_sprite.frame = randi() % max_die_faces
		timer.start()
		yield(timer, "timeout")

func get_value():
	return die_sprite.frame + 1
