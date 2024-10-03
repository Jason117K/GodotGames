extends Area2D

var sun_value = 25  # Amount of sun points generated

func _ready():
	$SunTimer.start()  # Start the timer
	$SunTimer.connect("timeout", self, "_on_SunTimer_timeout")

# Called every time the sun timer reaches timeout
func _on_SunTimer_timeout():
	generate_sun()

# Function to handle sun generation
func generate_sun():
	print("Sun generated: " + str(sun_value))
	var game_manager = get_tree().root.get_node("Main/PlantManager")
	game_manager.add_sun(sun_value)
