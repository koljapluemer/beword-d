extends Node2D

var jelly_pieces = []
var width = 8
var height = 6
var jelly = preload("res://scenes/piece_jelly.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	jelly_pieces = make_2d_array();

func make_2d_array():
	var arr = [];
	for i in width:
		arr.append([]);
		for j in height:
			arr[i].append(null);
	return arr;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_grid_make_jelly(board_position, grid_position):
	if jelly_pieces.size() == 0:
		jelly_pieces = make_2d_array();
	var current = jelly.instantiate();
	current.position = board_position;
	print("jelly pieces: ", jelly_pieces);
	var x = grid_position.x;
	var y = grid_position.y;
	jelly_pieces[x][y] = current;
	add_child(current);
	print("jelly made at: ", board_position);
		
