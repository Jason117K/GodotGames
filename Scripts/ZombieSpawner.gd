extends Node2D

# Path to the base zombie scene
var base_zombie_scene = preload("res://Scenes/BasicZombie.tscn")  
var cone_zombie_scene = preload("res://Scenes/ConeHeadZombie.tscn") 
var bucket_zombie_scene = preload("res://Scenes/BucketHeadZombie.tscn") 
var spawn_interval = 5.0  # Time interval between spawns (seconds)

export var wave1_spawn_interval = 3.0
export var wave2_spawn_interval = 3.0
export var wave3_spawn_interval = 3.0

#Refactor put in containers 
export var r1_BaseZombies = 5
export var r2_BaseZombies = 5
export var r3_BaseZombies = 5

var r1_BaseZombiesSpawned = 0
var r2_BaseZombiesSpawned = 0
var r3_BaseZombiesSpawned = 0


export var r1_ConeheadZombies = 5
export var r2_ConeheadZombies = 5
export var r3_ConeheadZombies = 5

var r1_ConeheadZombiesSpawned = 0
var r2_ConeheadZombiesSpawned = 0
var r3_ConeheadZombiesSpawned = 0

export var r1_BucketheadZombies = 5
export var r2_BucketheadZombies = 5
export var r3_BucketheadZombies = 5

var r1_BucketheadZombiesSpawned = 0
var r2_BucketheadZombiesSpawned = 0
var r3_BucketheadZombiesSpawned = 0

var random_adjustment = rand_range(-1.0, 1.0)

func _ready():
	# Create a timer to spawn zombies
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.autostart = true
	spawn_timer.connect("timeout", self, "_on_SpawnTimer_timeout")
	add_child(spawn_timer)

func _on_SpawnTimer_timeout():
	#spawn_base_zombie()
	pass

func spawn_base_zombie():
	var zombie_instance = base_zombie_scene.instance()
	zombie_instance.position = self.position  # Adjust position as needed
	get_parent().add_child(zombie_instance)  # Add to the GameLayer
	
func spawn_cone_zombie():
	var zombie_instance = cone_zombie_scene.instance()
	zombie_instance.position = self.position + Vector2(-30,0)  # Adjust position as needed
	get_parent().add_child(zombie_instance)  # Add to the GameLayer
	
func spawn_bucket_zombie():
	var zombie_instance = bucket_zombie_scene.instance()
	zombie_instance.position = self.position + Vector2(-10,0)  # Adjust position as needed
	get_parent().add_child(zombie_instance)  # Add to the GameLayer


func _on_Wave1Timer_timeout():
	$Wave1Timer.wait_time = wave1_spawn_interval
	random_adjustment = rand_range(-0.4, 0.4)
	wave1_spawn_interval = wave1_spawn_interval + random_adjustment
	if r1_BaseZombiesSpawned < 8 :
		spawn_base_zombie()
		#print("R1 Base Zombie Spawned")
		r1_BaseZombiesSpawned = r1_BaseZombiesSpawned + 1

func _on_Wave2Timer_timeout():
	$Wave1Timer.stop()
	#print("R1 Over")
	random_adjustment = rand_range(-0.4, 0.2)
	wave2_spawn_interval = wave2_spawn_interval + random_adjustment
	$Wave2Timer.wait_time = wave2_spawn_interval
	if r2_ConeheadZombiesSpawned < 8 :
		spawn_cone_zombie()
		#print("R2 Cone Zombie Spawned")
		r2_ConeheadZombiesSpawned = r2_ConeheadZombiesSpawned + 1
	if r2_BaseZombiesSpawned < 8 :
		spawn_base_zombie()
		r2_BaseZombiesSpawned = r2_BaseZombiesSpawned + 1

func _on_Wave3Timer_timeout():
	$Wave2Timer.stop()
	print("R2 Over")
	$Wave3Timer.wait_time = wave3_spawn_interval
	random_adjustment = rand_range(-0.4, 0.4)
	wave3_spawn_interval = wave3_spawn_interval + random_adjustment
	if r3_BaseZombiesSpawned < 5 :
		spawn_base_zombie()
		r3_BaseZombiesSpawned = r3_BaseZombiesSpawned + 1
	if r3_ConeheadZombiesSpawned < 6 :
		spawn_cone_zombie()
		r3_ConeheadZombiesSpawned = r3_ConeheadZombiesSpawned + 1
	if r3_BucketheadZombiesSpawned < 7 :
		spawn_bucket_zombie()
		r3_BucketheadZombiesSpawned = r3_BucketheadZombiesSpawned + 1

