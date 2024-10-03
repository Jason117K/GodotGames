extends Node2D

var zombie_scene = preload("res://BasicZombie.tscn")  # Path to the zombie scene
var spawn_interval = 5.0  # Time interval between spawns (seconds)

func _ready():
	# Create a timer to spawn zombies
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.autostart = true
	spawn_timer.connect("timeout", self, "_on_SpawnTimer_timeout")
	add_child(spawn_timer)

func _on_SpawnTimer_timeout():
	spawn_zombie()

func spawn_zombie():
	var zombie_instance = zombie_scene.instance()
	zombie_instance.position = self.position  # Adjust position as needed
	get_parent().add_child(zombie_instance)  # Add to the GameLayer
