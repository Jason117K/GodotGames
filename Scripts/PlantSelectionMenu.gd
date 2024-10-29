extends Control

var selected_plant = sunflower_scene  # Holds the currently selected plant scene

# Preload the plant scenes
var peashooter_scene = preload("res://Scenes/Peashooter.tscn")
var sunflower_scene = preload("res://Scenes/Sunflower.tscn")
var walnut_scene = preload("res://Scenes/WalnutTree.tscn")




func _ready():
	# Connect button signals to their respective functions
	var root = get_parent().get_parent().get_name()
	
	if root == "Main" or root == "Level2":
		$HBoxContainer/PeashooterButton2.connect("pressed", self, "_on_PeashooterButton_pressed")
		$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")
		$HBoxContainer/WalnutButton.visible = false
	else:
		$HBoxContainer/PeashooterButton2.connect("pressed", self, "_on_PeashooterButton_pressed")
		$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")
		$HBoxContainer/WalnutButton.connect("pressed", self, "_on_WalnutButton_pressed")

	#print(root)
	
	
func _on_PeashooterButton_pressed():
	selected_plant = peashooter_scene
	print("Peashooter selected")

func _on_SunflowerButton_pressed():
	selected_plant = sunflower_scene
	print("Sunflower selected")
	
func _on_WalnutButton_pressed():
	selected_plant = walnut_scene
	print("Walnut selected")
