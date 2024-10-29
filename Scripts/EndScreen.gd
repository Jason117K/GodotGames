extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(0,8, 5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_pressed():
	print("p")
	get_tree().quit()


func _on_PlayAgain_pressed():
	var new_scene = preload("res://Scenes/StartScreen.tscn")  # Load the Main scene
	get_tree().change_scene_to(new_scene)       # Switch to the Main scene
