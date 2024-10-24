extends Area2D

var sun_value = 50  # Amount of sun points generated
var health = 100
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
	
	sun_instance.global_position = self.global_position + Vector2(0,-40)
	
func take_damage(damage):
	print("taking damage, health is " , health)
	health = health - damage
	if(health <= 0):
		queue_free()
	

	
