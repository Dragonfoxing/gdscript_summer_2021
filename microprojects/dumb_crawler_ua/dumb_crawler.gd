extends CharacterBody2D

#var dir = Vector2(0,0)
var dir = 0

var dirs = [
	Vector2(0,-1), #up
	Vector2(1,-1), #up-right
	Vector2(1,0), #right
	Vector2(1,1), #down-right
	Vector2(0,1), #down
	Vector2(-1, 1), #down-left
	Vector2(-1, 0), #left
	Vector2(-1,-1) #up-left
]

@export var idle_time = 10.0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	random_dir()
	rotate_crawler()
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", Callable(self, "destroy_crawler"))
	timer.start(idle_time)
	
	pass

func _process(delta):
	position = position + dirs[dir] * delta * 100
	change_dir()
	
func change_dir():
	var dowe = rng.randf_range(0, 1)
	if(dowe > 0.9):
		var nxt = rng.randi_range(-1, 1)
		if(nxt != 0):
			#random_dir()
			dir+=nxt
			if(dir<0): dir=7
			elif(dir>7): dir=0
			rotate_crawler()
		
func random_dir():
	dir = rng.randi_range(0, 7)
	#dir.x = rng.randi_range(-1, 1)
	#dir.y = rng.randi_range(-1, 1)

func rotate_crawler():
	var rot = deg_to_rad(dir*45)
	rotation = rot
	
func destroy_crawler():
	queue_free()
	
#signals
func on_contact(b):
	
	pass
