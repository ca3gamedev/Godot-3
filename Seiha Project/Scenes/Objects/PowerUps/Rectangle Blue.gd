extends "res://Scenes/Objects/PowerUps/PowerUp Interface.gd"


### REFERENCES

export(NodePath) var PowerUpLocalizerPath
onready var PowerUpLocalizer = get_node(PowerUpLocalizerPath)

var PlayerD

func _ready():
	yield(get_tree(), "idle_frame")
	PlayerD = PowerUpLocalizer.Player.PlayerDataLocalizer.get_node("Data")

###FUNCTIONS

func PowerUpBlue(body):
	PlayerD.x_powerup = 1
	PowerUpLocalizer.FighterManager.BlueArea.hide()
	PowerUpLocalizer.FighterManager.RedArea.show()

func PowerUpRed():
	PlayerD.x_powerup = 2
	PowerUpLocalizer.FighterManager.RedArea.hide()
	PowerUpLocalizer.FighterManager.BlueArea.show()
