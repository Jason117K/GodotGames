extends Sprite

# Pixel dimensions
export var pixel_width: int = 32
export var pixel_height: int = 32



func _ready():
	# Create a viewport to render the vector sprite at low resolution


	# Create a sprite node to display in the viewport
	var vector_sprite = Sprite.new()
	vector_sprite.texture = texture
	vector_sprite.scale = Vector2(
		pixel_width / texture.get_size().x,
		pixel_height / texture.get_size().y
	)



	self.scale = Vector2(
		texture.get_size().x / pixel_width,
		texture.get_size().y / pixel_height
	)
