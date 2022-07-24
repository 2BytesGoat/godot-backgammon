extends Node

var meta := {}


func _ready():
	var file = File.new()
	file.open("static/game_meta.json", File.READ)
	meta = parse_json(file.get_as_text())
	file.close()
