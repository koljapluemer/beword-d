extends Node2D

var color: String
var tween
var matched = false

@export var row_texture: Texture
@export var column_texture: Texture
@export var adjacent_texture: Texture


var is_row_bomb = false
var is_column_bomb = false
var is_adjacent_bomb = false

func make_column_bomb():
	is_column_bomb = true
	get_node("Overlay").texture = column_texture
	tween.kill()

func make_row_bomb():
	is_row_bomb = true
	get_node("Overlay").texture = row_texture
	tween.kill()
	
func make_adjacent_bomb():
	is_adjacent_bomb = true
	get_node("Overlay").texture = adjacent_texture
	tween.kill()

func move(target):
	tween.kill()
	tween = get_tree().create_tween()	
	var random_time = randf_range(0.1, 0.35)
	tween.tween_property(self, "position", target, random_time)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)


func set_matched():
	matched = true
	# get_node("Sprite2D").modulate = Color(1, 1, 1, .3)

func set_colorful():
	get_node("Sprite2D").texture = load("res://assets/tutorials/Pieces/" + color + ".png")

func add_hint_effect():
	# cyclically enlarge and shrink the piece
	tween = get_tree().create_tween()
	# tween.tween_property(self, "rotation", 2, 0.5).as_relative()
	tween.tween_property(self, "rotation", .08, 0.3).from_current()
	tween.set_loops()
	tween.tween_interval(0.5)
	tween.set_ease(Tween.EASE_IN_OUT)


func remove_hint_effect():
	tween.kill()
	rotation = 0
	scale = Vector2(1, 1)
