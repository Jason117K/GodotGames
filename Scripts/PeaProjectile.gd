extends Area2D

var speed = 300  # Speed of the projectile
var damage = 1.5  # Damage dealt to zombies

func _process(delta):
	position.x += speed * delta  # Move the projectile to the right

	# Remove the projectile if it goes off-screen
	if position.x > get_viewport_rect().size.x:
		queue_free()  # Remove projectile if off-screen



func _on_PeaProjectile_area_entered(area):
	#print("func called")
	if area.is_in_group("Zombie"):
		area.take_damage(damage)  # Call take_damage() on the zombie
		queue_free()  # Remove the projectile # Replace with function body.

