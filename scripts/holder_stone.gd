extends Node2D

var stone_pieces = []
var width = 10
var height = 9
var stone = preload("res://scenes/piece_stone.tscn")

@onready var game_manager = %GameManager

signal remove_stone
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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

func _on_grid_make_stone(board_position, grid_position):
	if stone_pieces.size() == 0:
		stone_pieces = make_2d_array();
	var current = stone.instantiate();
	current.position = board_position;
	var x = grid_position.x;
	var y = grid_position.y;
	stone_pieces[x][y] = current;
	add_child(current);
		


func _on_grid_damage_stone(grid_position):
	if stone_pieces.size() == 0:
		return;
	var stone_piece = stone_pieces[grid_position.x][grid_position.y];
	if stone_piece != null:
		stone_piece.take_damage(1);
		if stone_piece.health <= 0:
			stone_piece.queue_free();
			stone_pieces[grid_position.x][grid_position.y] = null;
			emit_signal("remove_stone", grid_position);
			game_manager.change_obstacle_counter(-1);
