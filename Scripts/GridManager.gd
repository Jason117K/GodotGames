extends Node2D


onready var tilemap = $TileMap

# The ID of the tile you want to set (you can check this in the TileSet editor)
#var tile_id = 2  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Function to set tiles for the first 'row_count' rows
func set_tiles_for_rows(row_start:int, row_count: int, tile_id: int):
	 # Get the number of columns in the tilemap (you can also use your own logic to define it)
	var map_width = tilemap.get_used_rect().size.x
	# Loop through the specified number of rows
	for y in range(row_start,row_count):
		# Loop through each column in the row
		for x in range(map_width):
			# Set the tile at (x, y) to the specified tile_id
			tilemap.set_cell(x, y, tile_id)
			#print("Set tiles for first ", row_count, " rows to tile ID: ", tile_id)
