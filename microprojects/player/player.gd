extends CharacterBody2D

@export var speed = 1.0
@export var focusSpeed = 0.33

var dir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	process_input()
	pass
	
func _physics_process(delta):
	if(get_slide_collision_count() > 0): _process_collision()
	
	var focused = Input.is_action_pressed("focus")
	
	#test for collisions first
	var col = move_and_collide(dir*(focusSpeed if focused else speed)*delta, true, true, true)
	if(col!=null): col.collider.queue_free()
	
	if(dir!=Vector2.ZERO):
		move_and_collide(dir*(focusSpeed if focused else speed)*delta)

		
	pass
	
func process_input():
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	dir=dir.normalized()
	
	pass

func _process_collision():
	var n = get_slide_collision_count()
	for i in range(n):
		var b = get_slide_collision(i)

	pass
