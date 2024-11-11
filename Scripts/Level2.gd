extends Node2D
#Level2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$GameLayer/GridManager.set_tiles_for_rows(2,6, 9)
	#$GameLayer/GridManager.set_tiles_for_rows(0,2, 5)
	$GameLayer/GridManager.set_tiles_for_rows(2,6, 9)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
