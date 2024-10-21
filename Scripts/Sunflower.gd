extends Area2D

var sun_value = 25  # Amount of sun points generated
var SunScene = preload("res://Scenes/Sun.tscn")  # Adjust the path to your sun sprite scene

func _ready():
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
	
	# Position the sun slightly above the sunflower with a random offset
	#print("Sunflower Pos Is : " , self.position)
	#print("Sun Pos Is : " , (self.position + Vector2(0,0)))
	
	sun_instance.global_position = self.global_position + Vector2(0,-40)
	
	var game_manager = get_tree().root.get_node("Main/PlantManager")
	#game_manager.add_sun(sun_value)
