extends Node2D
#Level1->2


var Lvl2 = preload("res://Scenes/Level2.tscn")  # Load the next scene

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(1,6, 5)


func _on_Continue_pressed():
	get_tree().change_scene_to(Lvl2)


func _on_PlayAgain_pressed():
	if(self.name == "Level1->2"):
		get_tree().change_scene("res://Scenes/Main.tscn")
	
