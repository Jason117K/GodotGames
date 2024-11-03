extends Node2D


var spawner

var currentBaseZombies
var currentConeZombies
var currentBucketZombies

onready var visibility = true

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner = get_parent()
	print(spawner.get_name())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	if $PreviewSprite.visible == true:
		var currentText1 = "Base Zombies : " + str(spawner.r1_BaseZombies)
		var currentText2 = "Cone Zombies : " + str(spawner.r1_ConeheadZombies)
		var currentText3 = "Bucket Zombies : " + str(spawner.r1_BucketheadZombies)
		$Control.visible = true
		$Control/Label.text = currentText1
		$Control/Label2.text = currentText2
		$Control/Label3.text = currentText3


func _on_Area2D_mouse_exited():
	$Control.visible = false
	$Control/Label.text = ""
	$Control/Label2.text = ""
	$Control/Label3.text = ""
	
	
	
	pass # Replace with function body.


func _on_ToggleVisibility_timeout():
	#$PreviewSprite.visible = !visibility
	#visibility = !visibility
	#print("Visibility Switch")
	swap_Visibility()
	
func swap_Visibility():
	$PreviewSprite.visible = !visibility
	visibility = !visibility
	#print("Visibility Switch")
	
	

