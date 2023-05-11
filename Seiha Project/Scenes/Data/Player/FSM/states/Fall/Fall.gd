extends "res://addons/net.kivano.fsm/content/FSMState.gd";
################################### R E A D M E ##################################
# For more informations check script attached to FSM node
#
#

##################################################################################
#####  Variables (Constants, Export Variables, Node Vars, Normal variables)  #####
######################### var myvar setget myvar_set,myvar_get ###################


onready var Root = $"../../../"
onready var Data = $"../../../Data"
var x_dir = 0


##################################################################################
#########                       Getters and Setters                      #########
##################################################################################
#you will want to use those
func getFSM(): return fsm; #defined in parent class
func getLogicRoot(): return logicRoot; #defined in parent class 

##################################################################################
#########                 Implement those below ancestor                 #########
##################################################################################
#you can transmit parameters if fsm is initialized manually
func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	pass

#when entering state, usually you will want to reset internal state here somehow
func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	Data.Onground = false
	x_dir = 0
	$"%Data".OnPlatform = false
	$"%Animations".play("Jump")

#when updating state, paramx can be used only if updating fsm manually
func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	
	Data.inertia -= Data.gravity
	if Data.inertia < - Data.max_fall:
		Data.inertia = -Data.max_fall
		
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		x_dir = -2
	elif Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		x_dir = 2
	
	var collision = Root.move_and_collide(Vector2(x_dir * 5, -Data.inertia * 0.8))
	if collision:
		if collision.collider.is_in_group("GROUND"):
			Data.Onground = true
			$"../../..".set_collision_layer_bit(5, true)
			$"../../..".set_collision_mask_bit(2, true)
		if collision.collider.is_in_group("Platform"):
			Data.OnPlatform = true


#when exiting state
func exit(toState=null):
	pass

##################################################################################
#########                       Connected Signals                        #########
##################################################################################

##################################################################################
#########     Methods fired because of events (usually via Groups interface)  ####
##################################################################################

##################################################################################
#########                         Public Methods                         #########
##################################################################################

##################################################################################
#########                         Inner Methods                          #########
##################################################################################

##################################################################################
#########                         Inner Classes                          #########
##################################################################################
