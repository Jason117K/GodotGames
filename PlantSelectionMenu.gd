extends Control

var selected_plant = sunflower_scene  # Holds the currently selected plant scene

# Preload the plant scenes
var peashooter_scene = preload("res://Peashooter.tscn")
var sunflower_scene = preload("res://Sunflower.tscn")

func _ready():
	# Connect button signals to their respective functions
	$HBoxContainer/PeashooterButton.connect("pressed", self, "_on_PeashooterButton_pressed")
	$HBoxContainer/SunflowerButton.connect("pressed", self, "_on_SunflowerButton_pressed")

func _on_PeashooterButton_pressed():
	selected_plant = peashooter_scene
	print("Peashooter selected")

func _on_SunflowerButton_pressed():
	selected_plant = sunflower_scene
	print("Sunflower selected")
