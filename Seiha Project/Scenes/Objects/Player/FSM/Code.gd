extends Node

onready var Anim = $"%AnimationTree"
onready var Root = $"../.."
onready var state_machine = Anim["parameters/playback"]

func GetKey() -> Vector2:
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		dir.x = -1
	if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		dir.x = 1
	if Input.is_action_pressed("JUMP"):
		dir.y = -1
	
	return dir

func JumpKey():
	if Input.is_action_pressed("JUMP"):
		return true
	
	return false

func SetXDir(dir):
	if dir == 0 or dir == $"%Data".IsRight:
		return
	$"%Data".IsRight = dir
	
	if dir == -1:
		$"%LEFTRIGHT".play("LEFT")
	if dir == 1:
		$"%LEFTRIGHT".play("RIGHT")

func IDLE():
	var dir = GetKey()
	
	Anim.set("parameters/MOVE/blend_position", Vector2(dir.x, 0))
	if JumpKey():
		state_machine.travel("JUMP")
	DownCheckPlatforms()
	CheckGround()
	
func WALK(delta):
	var dir = GetKey()
	
	Anim.set("parameters/MOVE/blend_position", Vector2(dir.x, 0))
	var speed = $"%Data".walk_speed * dir.x * delta * $"%Data".x_powerup
	Root.move_and_collide(Vector2(speed, 0))
	SetXDir(dir.x)
	if JumpKey():
		state_machine.travel("JUMP")
	DownCheckPlatforms()
	CheckGround()
	
func JUMP(delta):
	var dir = GetKey()
	var speed = $"%Data".walk_speed * dir.x * delta * $"%Data".x_powerup
	Root.move_and_collide(Vector2(speed, -$"%Data".inertia * delta))

func DownCheckPlatforms():
	if Input.is_action_just_released("DOWN") and $"%GroundRaycast".is_colliding():
		Root.set_collision_layer_bit(5, false)
		Root.set_collision_mask_bit(2, false)
		MakeFall()

func MakeFall():
	state_machine.travel("FALL")

func FALL(delta):
	var dir = GetKey()
	var speed = $"%Data".walk_speed * dir.x * delta * $"%Data".x_powerup
	var collision = Root.move_and_collide(Vector2(speed, $"%Data".gravity * delta))
	if collision:
		if collision.get_collider().is_in_group("GROUND"):
			state_machine.travel("MOVE")
		if collision.get_collider().is_in_group("Platform"):
			state_machine.travel("MOVE")

func BaseAttack():
	pass

func SetPlatformerCollision():
	Root.set_collision_layer_bit(5, true)
	Root.set_collision_mask_bit(2, true)

func CheckGround():
	if not $"%GroundRaycast".is_colliding():
		MakeFall()
