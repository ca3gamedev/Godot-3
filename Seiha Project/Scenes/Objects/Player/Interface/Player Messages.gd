extends "res://Scenes/Objects/Player/Interface/Player Basic Messages.gd"


## SHORTCUTS

var PlayerK
var PlayerD

func _ready():
	yield(get_tree(), "idle_frame")
	PlayerK = PlayerLocalizer.PlayerDataLocalizer.PlayerKinematic
	PlayerD = PlayerLocalizer.PlayerData


### INTERFACE IMPLEMENTATION

func Move():
	var x_direction = PlayerD.x_direction
	var speed = Vector2(PlayerD.x_speed * x_direction * PlayerD.x_powerup, 0)
	PlayerK.move_and_collide(speed)


func MoveWithGravity():
	if PlayerD.inertia > -PlayerD.min_fall_speed :
		PlayerD.inertia -= PlayerD.gravity
	var x_direction = PlayerD.x_direction
	var speed = Vector2(PlayerD.x_speed * x_direction, PlayerD.inertia * -1)
	var collision = PlayerK.move_and_collide(speed)
	if collision:
		if collision.collider.is_in_group("GROUND") : 
			GroundCollision()
		if collision.collider.is_in_group("WALL") :
			PlayerK.move_and_collide(Vector2.DOWN * (PlayerD.inertia * -1))

func GroundCollision():
	PlayerD.onground = true
	PlayerLocalizer.FSM.ChangeState("IDLE")

func Jump():
	PlayerD.inertia = PlayerD.jump_speed

func GetInput():
	var direction =  Vector2.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		direction.x = -1
	if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		direction.x = 1
	if Input.is_action_pressed("JUMP"):
		direction.y = 1
	
	return direction

func StopMotion():
	PlayerD.inertia = 0
	PlayerD.x_inertia = 0

func SetWalk(newspeed):
	PlayerD.x_direction = newspeed
