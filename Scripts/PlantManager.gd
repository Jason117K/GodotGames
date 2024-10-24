extends Node2D

var selected_plant_scene = null  # Updated: Holds the selected plant scene

var grid_size = 64 #64  # Assuming each grid cell is 64x64 pixels

var grid_map = {}  # Dictionary to store occupied cells
var sun_points = 50 

# Updated: Reference the PlantSelectionMenu dynamically
func get_selected_plant():
	return get_parent().get_node("UILayer/PlantSelectionMenu").selected_plant

func ready():
	sun_points = 75
#384,256

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			var mouse_pos = get_global_mouse_position()
			#print("Clicked mouse_pos is : ")
			#print(mouse_pos)
			var grid_pos = mouse_pos_to_grid(mouse_pos)
			#print("Clicked grid_pos is : ")
			#print(grid_pos)
			grid_pos = Vector2(grid_pos.x,grid_pos.y+64)
			if(grid_pos.x<769 && grid_pos.y<321):
				place_plant(grid_pos)

# Convert mouse position to a grid cell position
func mouse_pos_to_grid(mouse_pos: Vector2) -> Vector2:
	return Vector2(floor(mouse_pos.x / grid_size), floor(mouse_pos.y / grid_size)) * grid_size

# Place the selected plant on the grid
func place_plant(grid_pos: Vector2):
	if grid_pos in grid_map:
		print("Cell already occupied!")
		return
	var selected_plant_scene = get_selected_plant()  # Dynamically get the selected plant
	if selected_plant_scene == null:
		print("No plant selected!")
		return
	if sun_points >= 25:  # Assume the plant costs 25 sun points
		var plant_instance = selected_plant_scene.instance()
		plant_instance.position = Vector2(grid_pos.x+32,grid_pos.y-32)
		get_parent().get_node("GameLayer").add_child(plant_instance)

		# Mark the cell as occupied and reduce sun points
		grid_map[grid_pos] = plant_instance
		sun_points -= 25
		get_parent().get_node("UILayer/SunCounter/Label").text = "Sun: " + str(sun_points)
	else:
		print("Not enough sun points!")

func add_sun(amount):
	sun_points += amount
	get_parent().get_node("UILayer/SunCounter/Label").text = "Sun: " + str(sun_points)
