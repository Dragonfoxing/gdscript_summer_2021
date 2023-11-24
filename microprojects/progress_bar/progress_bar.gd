extends Node2D

@export var percentDone = 0.0

func _ready():
	pass

func _process(_delta):
	$Panel/TextureProgressBar.value = percentDone
