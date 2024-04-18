extends Node2D

@export var color: String
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# tween movement (godot4)

func move(target):
	tween = get_tree().create_tween()	
	tween.tween_property(self, "position", target, 0.3)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
