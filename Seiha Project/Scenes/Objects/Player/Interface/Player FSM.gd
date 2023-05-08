extends "res://Scenes/Objects/Player/Interface/FSM interface.gd"

### SHORTCUTS

var PlayerM
var PlayerD

func _ready():
	yield(get_tree(), "idle_frame")
	PlayerM = PlayerLocalizer.PlayerMessages
	PlayerD = PlayerLocalizer.PlayerData

### INTERFACE IMPLEMENTATION

func Idle():
	if PlayerM != null:
		var direction = PlayerM.GetInput()
		InputChecker(direction)

func Walk():
	if PlayerM != null:
		var direction = PlayerM.GetInput()
		InputChecker(direction)

func Jump():
	if PlayerM != null:
		var direction = PlayerM.GetInput()
		JumpChecker(direction)

func InputChecker(direction):
	if direction == Vector2.ZERO:
		PlayerM.SetWalk(0)
		ChangeState("IDLE")
		return
	if direction.x != 0 and direction.y == 0:
		ChangeState("WALK")
		PlayerM.SetWalk(direction.x)
	if direction.y != 0 and PlayerD.onground:
		PlayerM.Jump()
		ChangeState("JUMP")

func JumpChecker(direction):
	PlayerM.SetWalk(direction.x)
	PlayerM.MoveWithGravity()
	
func PhysicsUpdate():
	if PlayerM != null:
		PlayerM.Move()
