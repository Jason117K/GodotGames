extends Node2D
#ZombieSpawner

# Path to the base zombie scene
var base_zombie_scene = preload("res://Scenes/BasicZombie.tscn")  
var cone_zombie_scene = preload("res://Scenes/ConeHeadZombie.tscn") 
var bucket_zombie_scene = preload("res://Scenes/BucketHeadZombie.tscn") 

# Array to hold zombie types
var wave1_zombies = []  
var wave2_zombies = []  
var wave3_zombies = []  

# Lists of each Zombie per round
export var r1_BaseZombies = 5
export var r2_BaseZombies = 5
export var r3_BaseZombies = 5

var baseZombies = []

export var r1_ConeheadZombies = 5
export var r2_ConeheadZombies = 5
export var r3_ConeheadZombies = 5

export var r1_BucketheadZombies = 5
export var r2_BucketheadZombies = 5
export var r3_BucketheadZombies = 5

# The current wave we are on
var numWave = 0

var random_adjustment = rand_range(-1.0, 1.0)
export var waveDelay = 0.5

#Onready var???
var baseZombieLabel 
var coneZombieLabel 
var bucketZombieLabel 

func _ready():
	populate_zombies(r1_BaseZombies,r1_ConeheadZombies,r1_BucketheadZombies,wave1_zombies)
	populate_zombies(r2_BaseZombies,r2_ConeheadZombies,r2_BucketheadZombies,wave2_zombies)
	populate_zombies(r3_BaseZombies,r3_ConeheadZombies,r3_BucketheadZombies,wave3_zombies)
	$WaveDelay.wait_time = waveDelay
	
	baseZombies.append(r1_BaseZombies)
	baseZombies.append(r2_BaseZombies)
	baseZombies.append(r3_BaseZombies)
	
	#if self.children.size() > 1 :
	#	baseZombieLabel = get_child(1).get_child(2).get_child(1)
	#	coneZombieLabel = get_child(1).get_child(2).get_child(2)
	#	bucketZombieLabel = get_child(1).get_child(2).get_child(3)
	
	#baseZombieLabel = get_child(1).get_child(2).get_child(1)
	#coneZombieLabel = get_child(1).get_child(2).get_child(2)
	#bucketZombieLabel = get_child(1).get_child(2).get_child(3)
	
	
	
	

	
	#baseZombieLabel.text = "Base Zombies: " + str(r1_BaseZombies)
	#coneZombieLabel.text = "Cone Zombies: " + str(r1_ConeheadZombies)
	#bucketZombieLabel.text = "Bucket Zombies: " + str(r1_BucketheadZombies)


func start_spawn_zombie():
	random_adjustment = rand_range(-0.5, 0.5)
	$WaveDelay.wait_time = waveDelay + random_adjustment
	$WaveDelay.start()
	
func spawn_zombie():
	
	match numWave:
		1:
			if(wave1_zombies.size() > 0):
				wave1_zombies.shuffle()
				var zombie_type = wave1_zombies.pop_front()
				var zombie_instance = zombie_type.instance()
				zombie_instance.position = self.position #Adjust position as needed
				get_parent().add_child(zombie_instance)  # Add to the GameLayer
				
				#print("Spawn wave 1")
				#print("Spawn1, Numwave is Now: ", numWave)
				
				#baseZombieLabel.text = "Base Zombies: " + str(r2_BaseZombies)
				#coneZombieLabel.text = "Cone Zombies: " + str(r2_ConeheadZombies)
				#bucketZombieLabel.text = "Bucket Zombies: " + str(r2_BucketheadZombies)
				

		2:
			if(wave2_zombies.size() > 0):
				wave2_zombies.shuffle()
				var zombie_type = wave2_zombies.pop_front()
				var zombie_instance = zombie_type.instance()
				zombie_instance.position = self.position + Vector2(-30,0)  #Adjust position as needed
				get_parent().add_child(zombie_instance)  # Add to the GameLayer
				print("Spawn wave 2")
				#baseZombieLabel.text = "Base Zombies: " + str(r3_BaseZombies)
				#coneZombieLabel.text = "Cone Zombies: " + str(r3_ConeheadZombies)
				#bucketZombieLabel.text = "Bucket Zombies: " + str(r3_BucketheadZombies)				

		3:
			if(wave3_zombies.size() > 0):
				wave3_zombies.shuffle()
				var zombie_type = wave3_zombies.pop_front()
				var zombie_instance = zombie_type.instance()
				zombie_instance.position = self.position + Vector2(-10,0) #Adjust position as needed
				get_parent().add_child(zombie_instance)  # Add to the GameLayer
				print("Spawn wave 3")
		_:
			print("Value is something else")
	
# Function to populate the zombies array based on numbers provided
func populate_zombies(base_zombie_count: int, conehead_zombie_count: int, 
					buckethead_zombie_count: int, zombie_wave: Array):
	# Add base zombies to the array
	for i in range(base_zombie_count):
		zombie_wave.append(base_zombie_scene)
	# Add conehead zombies to the array
	for i in range(conehead_zombie_count):
		zombie_wave.append(cone_zombie_scene)
		# Add buckethead zombies to the array
	for i in range(buckethead_zombie_count):
		zombie_wave.append(bucket_zombie_scene)
		
func increase_wave():
	numWave = numWave + 1


func _on_WaveDelay_timeout():
	spawn_zombie()
	$WaveDelay.stop()
