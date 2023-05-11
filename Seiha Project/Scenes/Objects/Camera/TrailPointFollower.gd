extends Position2D

export(float) var min_distance = 20
export(float) var speed
export(Vector2) var offset

func _ready():
	$Camera2D.offset = offset

func _process(delta):
	var direction = References.PlayerK.global_position - self.global_position
	
	if self.global_position.distance_to(References.PlayerK.global_position) > min_distance:
		self.position += (direction * delta * speed)
