extends Node2D
#StartScreen.gd


func _ready():
	$GridManager.set_tiles_for_rows(0,8, 5)
	$AudioStreamPlayer2D.playing = true


func _on_Button_pressed():
	var level1_scene = load("res://Scenes/Main.tscn")
	assert(get_tree().change_scene_to(level1_scene)== OK)
