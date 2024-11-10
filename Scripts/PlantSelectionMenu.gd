extends Control

var selected_plant = sunflower_scene  # Holds the currently selected plant scene

# Preload the plant scenes
var peashooter_scene = preload("res://Scenes/Peashooter.tscn")
var sunflower_scene = preload("res://Scenes/Sunflower.tscn")
var walnut_scene = preload("res://Scenes/WalnutTree.tscn")
var maw_scene = preload("res://Scenes/Maw.tscn")




func _ready():
	# Connect button signals to their respective functions
	var root = get_parent().get_parent().get_name()
	
	if root == "Main": #or root == "Level2":
		$HBoxContainer/PeashooterButton2.connect("pressed", self, "_on_PeashooterButton_pressed")
		$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")
		$HBoxContainer/WalnutButton.visible = false
		$HBoxContainer/MawButton.visible = false
	elif root == "Level2":
		$HBoxContainer/PeashooterButton2.connect("pressed", self, "_on_PeashooterButton_pressed")
		$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")
		$HBoxContainer/WalnutButton.connect("pressed", self, "_on_WalnutButton_pressed")
		$HBoxContainer/MawButton.visible = true
	else: #root = Level3
		$HBoxContainer/PeashooterButton2.connect("pressed", self, "_on_PeashooterButton_pressed")
		$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")
		$HBoxContainer/WalnutButton.connect("pressed", self, "_on_WalnutButton_pressed")
		#$HBoxContainer/MawButton.visible = false

	#print(root)
	
	
func _on_PeashooterButton_pressed():
	selected_plant = peashooter_scene
	print("Peashooter selected")
	$UIClickAudio.play()
	
func _on_SunflowerButton_pressed():
	selected_plant = sunflower_scene
	print("Sunflower selected")
	$UIClickAudio.play()
	
func _on_WalnutButton_pressed():
	selected_plant = walnut_scene
	print("Walnut selected")
	$UIClickAudio.play()


func _on_MawButton_pressed():
	selected_plant = maw_scene
	print("Maw Selected")
	$UIClickAudio.play()
	pass # Replace with function body.
