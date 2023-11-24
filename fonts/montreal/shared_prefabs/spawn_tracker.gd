extends CanvasLayer


func _ready():
	pass
	
func _process(delta):
	$Entities.text = "Entities spawned: " + str(round(get_tree().get_nodes_in_group("spawned").size()))
	$FPS.text = "FPS: " + str(round(Performance.get_monitor(Performance.TIME_FPS)))
	$Memory.text = "Memory: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024)) + "MB"
 	
