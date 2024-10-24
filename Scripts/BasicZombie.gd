extends Area2D

var health = 10 # Health of the zombie
var speed = 34 # Movement speed
var attack_power = 10


var is_attacking = false # Whether or not we attacking
var target_plant = null  # Holds reference to the plant being attacked

# Raycast to detect plants in front of the zombie
onready var attack_ray = $DMG_RayCast2D


func _process(delta):
	if not is_attacking:
		$AnimatedSprite.play("default")
		# Only move if not attacking 
		position.x -= speed * delta  # Move left across the screen
		# Check if there is a plant to attack

		
		if attack_ray.is_colliding():
			print("Its collding")
			var collider = attack_ray.get_collider()
			if collider.is_in_group("Plants"):
				start_attack(collider)  # Start attacking the plant
				
	#position.x -= speed * delta  # Move left across the screen
	
# Starts the attack on the plant
func start_attack(plant):
	is_attacking = true
	target_plant = plant
	attack_plant()
	
# Function to damage the plant
func attack_plant():
	
	$AnimatedSprite.play("Attack") # Play attack animation
	#Check if Plant is Valid and Damage It
	if target_plant : #and target_plant.is_instance_valid():
		pass
		#target_plant.take_damage(attack_power)
	if attack_ray.is_colliding():
		var collider = attack_ray.get_collider()
		if collider.is_in_group("Plants"):
			if target_plant.health <= 0:
				stop_attack() # Stop attacking if the plant is destroyed
			else:
				pass
				#attack_plant() # Keep attacking if plant is sitll alive
		else:
			stop_attack() # Stop attacking if the collider not touch plant
	else:
		stop_attack() # Stop attacking if attack_ray isn't hitting

# Stops the attack and resumes movement
func stop_attack():
	is_attacking = false
	target_plant = null


# Function to handle taking damage
func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()  # Remove zombie when health is zero


func _on_Timer_timeout():
	print("Attack Ray Collider is : ", attack_ray.get_collider())

