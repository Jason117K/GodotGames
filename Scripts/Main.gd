extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameLayer/GridManager.set_tiles_for_rows(2,5, 9)
	$GameLayer/GridManager.set_tiles_for_rows(0,2, 5)
	$GameLayer/GridManager.set_tiles_for_rows(5,7, 5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
