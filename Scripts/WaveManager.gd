extends Node

var current_wave = 1                # Current wave number
var zombies_per_wave = 2           # Number of zombies in the current wave
var spawn_interval = 3.0            # Time interval between each zombie spawn
var time_between_waves = 20.0       # Delay before starting a new wave

var wave_active = false             # Whether a wave is currently active
var zombies_spawned = 0             # Counter for spawned zombies
var zombie_scene = preload("res://Scenes/BasicZombie.tscn")  # Path to the zombie scene

var spawners = []  # Array to hold all ZombieSpawner nodes

export var StartDelay = 10
export var Wave1_Interval = 7.5
export var Wave2_Interval = 9
export var Wave3_Interval = 5.5

var numWave = 0

func _ready():
	$ProceedGame.wait_time = StartDelay
	$Wave1.wait_time = Wave1_Interval
	$Wave2.wait_time = Wave2_Interval
	for child in get_parent().get_parent().get_node("GameLayer").get_children():
		if "ZombieSpawner" in child.name:
			spawners.append(child)
	 #start_wave()

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
	


func _on_ProceedGame_timeout():
	
	match numWave:
		0:
			$ProceedGame.wait_time = 45
			$Lane1.start()
			numWave = numWave + 1
		1:
			$Wave2.start()
			$ProceedGame.wait_time = 60
			numWave = numWave + 1
		2:
			$Wave3.start()
			$ProceedGame.stop()
		_:
			print("Value is something else")


func _on_Wave1_timeout():
	for spawner in spawners:
		spawner.spawn_base_zombie()


func _on_Wave2_timeout():
	#Make call diff method, group zombies by wave not type
	for spawner in spawners:
		spawner.spawn_base_zombie()


func _on_Wave3_timeout():
	#Make call diff method, group zombies by wave not type
	for spawner in spawners:
		spawner.spawn_base_zombie()

