extends Node2D
#Level3

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameLayer/GridManager.set_tiles_for_rows(1,6, 9)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
