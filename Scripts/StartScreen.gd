extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(0,8, 5)
	$AudioStreamPlayer2D.playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var level1_scene = load("res://Scenes/Main.tscn")
	get_tree().change_scene_to(level1_scene)
	pass # Replace with function body.
