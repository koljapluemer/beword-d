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

func make_row_bomb():
	is_row_bomb = true
	get_node("Overlay").texture = row_texture

func make_adjacent_bomb():
	is_adjacent_bomb = true
	get_node("Overlay").texture = adjacent_texture



func _ready():
	# set Sprite2D to "res://assets/tutorials/Pieces/Grey.png"
	get_node("Sprite2D").texture = load("res://assets/tutorials/Pieces/grey.png")
	# with chance 1/6 set the piece to be colorful

func move(target):
	tween = get_tree().create_tween()	
	var random_time = randf_range(0.1, 0.35)
	tween.tween_property(self, "position", target, random_time)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_matched():
	matched = true
	# get_node("Sprite2D").modulate = Color(1, 1, 1, .3)

func set_colorful():
	get_node("Sprite2D").texture = load("res://assets/tutorials/Pieces/" + color + ".png")
