extends Node

var current_wave = 1                # Current wave number
var zombies_per_wave = 2           # Number of zombies in the current wave
var spawn_interval = 3.0            # Time interval between each zombie spawn
var time_between_waves = 20.0       # Delay before starting a new wave

var wave_active = false             # Whether a wave is currently active
var zombies_spawned = 0             # Counter for spawned zombies
var zombie_scene = preload("res://BasicZombie.tscn")  # Path to the zombie scene

var spawners = []  # Array to hold all ZombieSpawner nodes



func _ready():
	for child in get_parent().get_parent().get_node("GameLayer").get_children():
		if "ZombieSpawner" in child.name:
			spawners.append(child)
	 start_wave()

# Function to start a new wave
func start_wave():
	wave_active = true
	zombies_spawned = 0
	zombies_per_wave += 1  # Increase zombies per wave
	spawn_interval = max(1, spawn_interval - 0.07)  # Decrease spawn interval but not below 1
	print("Wave " + str(current_wave) + " started!")
	spawn_zombies()

# Function to spawn zombies at regular intervals
func spawn_zombies():
	if zombies_spawned < zombies_per_wave:
		spawn_zombie()
		zombies_spawned += 1
		yield(get_tree().create_timer(spawn_interval), "timeout")  # Wait between spawns
		spawn_zombies()
	else:
		wave_active = false
		print("Wave " + str(current_wave) + " completed!")
		current_wave += 1
		# Start a new wave after a delay
		yield(get_tree().create_timer(time_between_waves), "timeout")
		start_wave()


# Randomly choose a spawner and spawn a zombie
func spawn_zombie():
	if spawners.size() == 0:
		print("Error: No spawners available!")
		return  # Exit the function if there are no spawners

	var random_spawner = spawners[randi() % spawners.size()]
	var spawn_position = random_spawner.position
	random_spawner.spawn_zombie()
	
