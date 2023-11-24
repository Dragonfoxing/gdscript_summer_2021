extends RigidBody2D

var dir = Vector2(0,0)
var velocity = Vector2(0,0)
var isFalling = false
var isJumping = false

var jumpTimer = 1.0
var jumpTime = 0.0

func _ready():
	pass

func _process(_delta):
	update_dir()
	
func _physics_process(delta):
	if(is_on_ground()):
		physics_grounded()
	
	linear_velocity = velocity

func is_on_ground():
	return ($GroundCastLeft.is_colliding() or $GroundCastRight.is_colliding())

func update_dir():
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
func physics_grounded():
	if(isFalling):
		isFalling = false
	elif(Input.get_action_strength("fire")):
		isJumping = true
		
	velocity.x = dir.x*100
	
	pass
	
func physics_jumping(delta):
	
	jumpTime+=delta
	if(jumpTime >= jumpTimer):
		isJumping = false
		isFalling = true
	
	velocity.y = dir.y*10
	
	velocity.x = dir.x*100
	pass
	
func physics_falling():
	velocity.y += 10.0
	
	pass
