extends Node2D

var selected_plant_scene = null  # Updated: Holds the selected plant scene

var grid_size = 64 #64  # Assuming each grid cell is 64x64 pixels

var grid_map = {}  # Dictionary to store occupied cells
var sun_points = 200

var plant_cost = 25

# Updated: Reference the PlantSelectionMenu dynamically
func get_selected_plant():
	return get_parent().get_node("UILayer/PlantSelectionMenu").selected_plant

func ready():
	#print(get_parent().get_name())
	
	pass
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
			#print(get_parent().name)
			if(get_parent().name == "Main"):
				if(grid_pos.x<769 && grid_pos.y<321 && grid_pos.y > 128):
					#print("Place Plant " , grid_pos)
					place_plant(grid_pos)
			else:
				if(grid_pos.x<769 && grid_pos.y<385 && grid_pos.y > 64):
					#print("Place Plant " , grid_pos)
					place_plant(grid_pos)

# Convert mouse position to a grid cell position
func mouse_pos_to_grid(mouse_pos: Vector2) -> Vector2:
	return Vector2(floor(mouse_pos.x / grid_size), floor(mouse_pos.y / grid_size)) * grid_size

func clear_space(passed_grid_pos):
	#print("Passed Pos Is : ")
	#print(passed_grid_pos)
	var new_passed_grid_pos = mouse_pos_to_grid(passed_grid_pos)
	#print(new_passed_grid_pos)
	#grid_map[new_passed_grid_pos] = null
	new_passed_grid_pos = Vector2(new_passed_grid_pos.x,new_passed_grid_pos.y+64)
	print("New Passed Grid Pos : ",new_passed_grid_pos)
	print("Grid Map is : ", grid_map)
	grid_map.erase(new_passed_grid_pos)
	print("Grid Map is : ", grid_map)
	

func get_cost(this_selected_plant_scene):
	print(this_selected_plant_scene)
	if("Sunflower" in this_selected_plant_scene.name):
		plant_cost = 25
	if("Peashooter" in this_selected_plant_scene.name):
		plant_cost = 50
	if("Walnut" in this_selected_plant_scene.name):
		plant_cost = 75

# Place the selected plant on the grid
func place_plant(grid_pos: Vector2):
	#if grid_pos != null:
	#	print("Cell Occupied Already")
	#	#return
	if grid_pos in grid_map:
		print("Cell already occupied!")
		return
	#print(grid_map)
	selected_plant_scene = get_selected_plant()  # Dynamically get the selected plant
	
	if selected_plant_scene == null:
		print("No plant selected!")
		return
	var plant_instance = selected_plant_scene.instance()
	get_cost(plant_instance)
	if sun_points >= plant_cost:  # Assume the plant costs 25 sun points
		plant_instance.position = Vector2(grid_pos.x+32,grid_pos.y-32)
		get_parent().get_node("GameLayer").add_child(plant_instance)

		# Mark the cell as occupied and reduce sun points
		grid_map[grid_pos] = plant_instance
		sun_points -= plant_cost
		get_parent().get_node("UILayer/SunCounter/Label").text = "Blood: " + str(sun_points)
		
		#Play the sound
		$PlacePlantAudioPlayer.play()
		
	else:
		print("Not enough sun points!")

func add_sun(amount):
	print("Add Sun: " , amount)
	sun_points += amount
	get_parent().get_node("UILayer/SunCounter/Label").text = "Blood: " + str(sun_points)
	
func play_sun_collect():
	$SunCollectPlayer.play()
	


func _on_SetSun_timeout():
	if(get_parent().name == "Main"):
		sun_points = 75
		get_parent().get_node("UILayer/SunCounter/Label").text = "Blood: " + str(sun_points)
	else:
		sun_points = 200
		get_parent().get_node("UILayer/SunCounter/Label").text = "Blood: " + str(sun_points)

