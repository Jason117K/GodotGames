extends Area2D

var health = 100
var attack_speed = 1.5  # Seconds between shots
var projectile_scene = preload("res://Scenes/PeaProjectile.tscn")  # Load the projectile scene

func _ready():
	$ShootTimer.start()  # Start the shoot timer
	$ShootTimer.connect("timeout", self, "_on_ShootTimer_timeout")

# Called every time the shoot timer reaches timeout
func _on_ShootTimer_timeout():
	shoot_projectile()

# Function to create and shoot a new projectile
func shoot_projectile():
	var projectile = projectile_scene.instance()
	projectile.position = position + Vector2(32, 0)  # Adjust starting position
	get_parent().add_child(projectile)  # Add the projectile to the game layer

func take_damage(damage):
	print("taking damage, health is " , health)
	health = health - damage
	if(health <= 0):
		queue_free()
