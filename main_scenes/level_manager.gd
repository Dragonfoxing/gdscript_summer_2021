extends Node

var data
var duration
var currentTime = 0
var progressBar

var minibossActive = false
var bossActive = false

func _ready():
	data = $LevelData
	duration = data.duration
	
	progressBar = get_node("../UI/ProgressBar")
	
	pass
	
func _process(delta):
	if(not minibossActive and not bossActive):
		currentTime+=delta
		update_progress_bar(currentTime/duration)
	pass
	
func update_progress_bar(value):
	progressBar.percentDone = 100*value
