extends Area2D

# Reference to the PlantManager or GameManager to update the sun count
#var plant_manager = preload("res://Scenes/PlantManager.tscn")


# Called when the node is added to the scene
func _ready():
	# Connect the mouse-entered signal to detect when the player hovers over the sun
	#$CollisionObject2D.connect("mouse_entered", self, "_on_mouse_entered")
	#Absorbs the sun when the mouse hovers over it
	pass
	
	
	
func _on_Sun_mouse_entered():
	#print("Claiming Sun")
	# Access the root node of the current scene
	var root = get_tree().current_scene
	#var plant_manager = get_tree().root.get_node("Main/PlantManager")
	var plant_manager = root.get_node("PlantManager")
	if plant_manager:  # If the PlantManager or GameManager is set
		
		plant_manager.add_sun(25)  # Add 25 sun points (or whatever amount)
	# Queue the sun for deletion (simulate absorption)
	queue_free()

