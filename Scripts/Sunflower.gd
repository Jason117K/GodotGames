extends Area2D

#var sun_value = 50  # Amount of sun points generated
var health = 100
var SunScene = preload("res://Scenes/Sun.tscn")  # Adjust the path to your sun sprite scene
var PlantManager

func _ready():
	#get_parent().get_node("GameLayer").add_child(plant_instance)
						#Gets GameLayer/Gets Main
	PlantManager = get_parent().get_parent().get_node("PlantManager")
	$SunTimer.start()  # Start the timer
	$SunTimer.connect("timeout", self, "_on_SunTimer_timeout")
	

# Called every time the sun timer reaches timeout
func _on_SunTimer_timeout():
	generate_sun()

# Function to handle sun generation
func generate_sun():
	#print("Sun generated: " + str(sun_value))
	var sun_instance = SunScene.instance()  # Create a new instance of the sun
	add_child(sun_instance)  # Add the sun to the scene
	
	sun_instance.global_position = self.global_position + Vector2(0,-40)

#func mouse_pos_to_grid(mouse_pos: Vector2) -> Vector2:
#	pass
	#return Vector2(floor(mouse_pos.x / grid_size), floor(mouse_pos.y / grid_size)) * grid_size


func take_damage(damage):
	#print("taking damage, health is " , health)
	health = health - damage
	if(health <= 0):
		#PlantManager.kill_plant()
		#print(self.global_position)
		PlantManager.clear_space(self.global_position)
		
		queue_free()
	

	
