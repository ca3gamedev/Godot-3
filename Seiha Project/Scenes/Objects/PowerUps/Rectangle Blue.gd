extends "res://Scenes/Objects/PowerUps/PowerUp Interface.gd"


### REFERENCES

export(NodePath) var PowerUpLocalizerPath
onready var PowerUpLocalizer = get_node(PowerUpLocalizerPath)

onready var PlayerD = References.PlayerD


###FUNCTIONS

func PowerUpBlue(body):
	PlayerD.x_powerup = SaveData.BluePowerUp
	PowerUpLocalizer.FighterManager.BlueArea.hide()
	PowerUpLocalizer.FighterManager.RedArea.show()

func PowerUpRed():
	PlayerD.x_powerup = SaveData.RedPowerUp
	PowerUpLocalizer.FighterManager.RedArea.hide()
	PowerUpLocalizer.FighterManager.BlueArea.show()
