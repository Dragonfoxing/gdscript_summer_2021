extends Node2D

var toSpawn = load("res://microprojects/dumb_crawler_ua/dumb_crawler.tscn")
var rng = RandomNumberGenerator.new()
@onready var coll = get_node("../Spawned")
@export var minChance = 0.01
func _ready():
	pass

func _process(delta):
	var chance = rng.randf_range(0, 1)
	if(chance > minChance):
		var instance = toSpawn.instantiate()
		instance.set_name("Enemy")
		instance.position = position
		coll.add_child(instance)
		instance.add_to_group("enemy")
