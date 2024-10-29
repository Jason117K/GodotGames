extends Node2D


var spawner

var currentBaseZombies
var currentConeZombies
var currentBucketZombies

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner = get_parent()
	print(spawner.get_name())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	var currentText1 = "Base Zombies : " + str(spawner.r1_BaseZombies)
	var currentText2 = "Base Zombies : " + str(spawner.r1_BaseZombies)
	var currentText3 = "Base Zombies : " + str(spawner.r1_BaseZombies)
	$Control/Label.text = currentText1
	$Control/Label2.text = currentText2
	$Control/Label3.text = currentText3


func _on_Area2D_mouse_exited():
	$Control/Label.text = ""
	$Control/Label2.text = ""
	$Control/Label3.text = ""
	
	
	
	pass # Replace with function body.
