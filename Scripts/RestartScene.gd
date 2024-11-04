extends Node2D


var retryScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(1,6, 5)
	print (retryScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Retry_pressed():
	#get_tree().change_scene_to(Lvl3)
	pass # Replace with function body.
