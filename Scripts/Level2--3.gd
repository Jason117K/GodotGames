extends Node2D
#Level2->3

var Lvl3 = preload("res://Scenes/Level3.tscn")  # Load the next scene

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(1,6, 5)
	





func _on_Continue_pressed():
	get_tree().change_scene_to(Lvl3)


func _on_PlayAgain_pressed():
	get_tree().reload_current_scene()
