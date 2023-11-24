extends Area2D
class_name ProximityGroup2D

signal broadcast(method_name, params)

enum dispatch_modes{
	PROXY,
	SIGNAL
}

@export var group_name := ""
@export var dispatch_mode: dispatch_modes
@export var execute_self_on_broadcast := true

func _ready():
	if group_name != "":
		add_to_group(group_name)

func _execute(method_name : String, params := []):
	if dispatch_mode == dispatch_modes.PROXY:
		var parent = get_parent()
		
		if parent != null and parent.has_method(method_name):
			parent.callv(method_name, params)
	else:
		emit_signal("broadcast", method_name, params)

func broadcast(method_name : String, params := []):
	if execute_self_on_broadcast:
		_execute(method_name, params)
	
	for a in get_overlapping_areas():
		if a.is_in_group(group_name) and a.has_method("_execute"):
			a._execute(method_name, params)
