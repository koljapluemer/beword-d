extends Node2D

@export var color: String
var tween
var matched = false


func _ready():
	pass

func move(target):
	tween = get_tree().create_tween()	
	tween.tween_property(self, "position", target, 0.3)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_matched():
	matched = true
	get_node("Sprite2D").modulate = Color(1, 1, 1, .3)
