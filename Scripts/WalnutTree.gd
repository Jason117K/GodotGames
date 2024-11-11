extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 650
var PlantManager

# Called when the node enters the scene tree for the first time.
func _ready():
	PlantManager = get_parent().get_parent().get_node("PlantManager")

func take_damage(damage):
	print("taking damage, health is " , health)
	health = health - damage
	if(health <= 0):
		PlantManager.clear_space(self.global_position)
		queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
