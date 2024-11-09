extends Area2D

var health = 100
var attack_speed = 1.5  # Seconds between shots
var projectile_scene = preload("res://Scenes/PeaProjectile.tscn")  # Load the projectile scene
var PlantManager
var canAttack = false

# Raycast to detect zombies in front of the spider
onready var attack_ray = $DMG_RayCast2D

func _ready():
	PlantManager = get_parent().get_parent().get_node("PlantManager")
	$ShootTimer.start()  # Start the shoot timer
	$ShootTimer.connect("timeout", self, "_on_ShootTimer_timeout")

func _process(delta):
	if attack_ray.is_colliding():
		#print("Its collding")
		var collider = attack_ray.get_collider()
		if collider:
			#print(collider.name)
			if collider.is_in_group("Zombie"):
				canAttack = true
				#pass
			else:
				canAttack = false
				


# Called every time the shoot timer reaches timeout
func _on_ShootTimer_timeout():
	if canAttack:
		shoot_projectile()

# Function to create and shoot a new projectile
func shoot_projectile():
	$AttackAudioPlayer.play()
	var projectile = projectile_scene.instance()
	projectile.position = position + Vector2(32, 0)  # Adjust starting position
	get_parent().add_child(projectile)  # Add the projectile to the game layer

func take_damage(damage):
	print("taking damage, health is " , health)
	health = health - damage
	if(health <= 0):
		PlantManager.clear_space(self.global_position)
		queue_free()
