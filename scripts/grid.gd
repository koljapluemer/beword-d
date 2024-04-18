extends Node2D

# Grid Variables for Main Game Grid
@export var width: int;
@export var height: int;
@export var x_start: int;
@export var y_start: int;
@export var offset: int;

var all_pieces: Array = [];

var possible_pieces = [
	preload("res://scenes/blue_piece.tscn"),
	preload("res://scenes/green_piece.tscn"),
	preload("res://scenes/orange_piece.tscn"),
	preload("res://scenes/pink_piece.tscn"),
	preload("res://scenes/yellow_piece.tscn")
]


func _ready():
	all_pieces = make_2d_array();
	spawn_pieces();


func spawn_pieces():
	for i in width:
		for j in height:
			var piece = possible_pieces[randi() % possible_pieces.size()].instantiate();
			var pos = grid_to_pixel(i, j);
			piece.position = pos;
			all_pieces[i][j] = piece;
			add_child(piece);

# Helper Functions

func grid_to_pixel(col, row):
	var x = x_start + col * offset;
	var y = y_start + row * -offset;
	return Vector2(x, y);

func pixel_to_grid(x, y):
	var col = int((x - x_start) / offset);
	var row = int((y - y_start) / offset);
	return Vector2(col, row);

func make_2d_array():
	var arr = [];
	for i in width:
		arr.append([]);
		for j in height:
			arr[i].append(null);
	return arr;
