extends PanelContainer

@export var fadeSpeed : float = 3.0
var currentFade : float = 0.0
@export var fadeDelay : float = 2.0
@onready var title = $Labels/CenterContainer/Title
@onready var desc = $Labels/CenterContainer2/Desc


func _ready():
	pass

func _process(_delta):
	currentFade += _delta
	
	if(currentFade > fadeDelay):
		#color.a = 1-((currentFade-fadeDelay)/fadeSpeed)
		print(1-((currentFade-fadeDelay)/fadeSpeed))
		$BG.color.a = 1-((currentFade-fadeDelay)/fadeSpeed)
		title.visible_ratio = 1-((currentFade-fadeDelay)/fadeSpeed)
		desc.visible_ratio  = 1-((currentFade-fadeDelay)/fadeSpeed)
	
	if((currentFade-fadeDelay)/fadeSpeed >= 1.0): queue_free()
	
	pass
