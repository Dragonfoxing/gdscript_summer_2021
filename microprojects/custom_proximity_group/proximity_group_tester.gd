extends Node2D


@onready var proxgroup = $ProximityGroup2D
var startpos

var t = 0

func _ready():
	startpos = position
	pass

func _process(delta):
	t+=delta*2
	position = startpos*(sin(t)*2)
	pass
func _we_collided():
	print("We did a collide!")


func _on_collided(area):
	proxgroup.broadcast("_we_collided")
	pass
