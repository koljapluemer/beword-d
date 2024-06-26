extends Node2D

var jelly_pieces = []
var width = 10
var height = 9
var jelly = preload("res://scenes/piece_jelly.tscn")
var stone = preload("res://scenes/piece_stone.tscn")

@onready var game_manager = %GameManager


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# jelly_pieces = make_2d_array();

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
	var x = grid_position.x;
	var y = grid_position.y;
	jelly_pieces[x][y] = current;
	add_child(current);
		


func _on_grid_damage_jelly(grid_position):
	if jelly_pieces.size() == 0:
		return;
	var jelly_piece = jelly_pieces[grid_position.x][grid_position.y];
	if jelly_piece != null:
		jelly_piece.take_damage(1);
		if jelly_piece.health <= 0:
			jelly_piece.queue_free();
			jelly_pieces[grid_position.x][grid_position.y] = null;
			game_manager.change_obstacle_counter(-1);
