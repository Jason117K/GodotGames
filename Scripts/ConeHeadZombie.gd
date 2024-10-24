extends Area2D

var health = 28 # Health of the zombie
var speed = 38  # Movement speed

var is_attacking = false # Whether or not we attacking
var target_plant = null  # Holds reference to the plant being attacked

var attack_power = 33

onready var attack_ray = $DMGRayCast2D

func _process(delta):
	if not is_attacking:
		$AnimatedSprite.play("Walk")
		# Only move if not attacking 
		position.x -= speed * delta  # Move left across the screen
		# Check if there is a plant to attack
		
		if attack_ray.is_colliding():
			print("Its collding")
			var collider = attack_ray.get_collider()
			if collider:
				if collider.is_in_group("Plants"):
					attack_plant(collider)
					
func attack_plant(collider):
	is_attacking = true
	target_plant = collider
	$AnimatedSprite.play("Attack")
	$AttackTimer.start()
	pass


# Stops the attack and resumes movement
func stop_attack():
	print("Stopping Attack")
	is_attacking = false
	target_plant = null
	


func _on_AttackTimer_timeout():
	print("fewhqwehiu;vBIOUiouqebgiop")
	if(is_instance_valid(target_plant)):
		if(target_plant.health >= 0):
			target_plant.take_damage(attack_power)
		else:
			stop_attack()
	else:
		stop_attack()
	
	#$AnimatedSprite.play("Attack")
	pass # Replace with function body.

# Function to handle taking damage
func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()  # Remove zombie when health is zero
