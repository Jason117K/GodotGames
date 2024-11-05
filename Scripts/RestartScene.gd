extends Node2D


var retryScene = "Cat"

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridManager.set_tiles_for_rows(1,6, 5)
	print (retryScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Retry_pressed():
	print(self.name)
	if(self.name == "RestartScene1"):
		get_tree().change_scene("res://Scenes/Main.tscn")
	elif(self.name == "RestartScene2"):
		get_tree().change_scene("res://Scenes/Level2.tscn")
	elif(self.name == "RestartScene3"):
		get_tree().change_scene("res://Scenes/Level3.tscn")

