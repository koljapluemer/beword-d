extends Node2D

# Grid Variables for Main Game Grid
@export var  width: int;
@export var  height: int;
@export var  x_start: int;
@export var  y_start: int;
@export var  offset: int;

var all_pieces: Array = [];

func make_2d_array():
	var arr = [];
	for i in width:
		arr.append([]);
		for j in height:
			arr[i].append(null);
	return arr;

func _ready():
	all_pieces = make_2d_array();
	print(all_pieces)
