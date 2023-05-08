extends Sprite

export(NodePath) var PowerUpLocalizerPath
onready var PowerUpLocalizer = get_node(PowerUpLocalizerPath)



func RedPowerUp(body):
	PowerUpLocalizer.Code.PowerUpRed()
