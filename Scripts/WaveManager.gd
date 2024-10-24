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
	$ProceedGame.start()
	$Wave1.wait_time = Wave1_Interval
	$Wave2.wait_time = Wave2_Interval
	for child in get_parent().get_parent().get_node("GameLayer").get_children():
		if "ZombieSpawner" in child.name:
			spawners.append(child)
			
			
func _on_ProceedGame_timeout():
	$ProceedGame.stop()
	print("ProceedGameTimeout")
	for spawner in spawners:
		spawner.increase_wave()
	
	match numWave:
		0:
			$ProceedGame.wait_time = 45
			$ProceedGame.start()
			$Wave1.start()
			numWave = numWave + 1
		1:
			$Wave2.start()
			$ProceedGame.wait_time = 60
			$ProceedGame.start()
			numWave = numWave + 1
		2:
			$Wave3.start()
			$ProceedGame.stop()
		_:
			print("Value is something else")


func _on_Wave1_timeout():
	
	var wave_Interval = Wave1_Interval
	var random_adjustment = rand_range(-1.0,0.1)
	wave_Interval = wave_Interval + random_adjustment
	
	#print("Wave 1 Interval is : ", wave_Interval)
	$Wave1.wait_time = wave_Interval
	
	for spawner in spawners:
		spawner.start_spawn_zombie()


func _on_Wave2_timeout():
	var wave_Interval = Wave2_Interval
	
	var random_adjustment = rand_range(-1.0,0.1)
	
	wave_Interval = wave_Interval + random_adjustment
	
	$Wave2.wait_time = wave_Interval
	
	
	for spawner in spawners:
		spawner.start_spawn_zombie()


func _on_Wave3_timeout():
	var wave_Interval = Wave3_Interval
	var random_adjustment = rand_range(-1.0,0.1)
	wave_Interval = wave_Interval + random_adjustment
	
	$Wave3.wait_time = wave_Interval
	
	for spawner in spawners:
		spawner.start_spawn_zombie()

