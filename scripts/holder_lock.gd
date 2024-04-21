extends Node2D

var lock_pieces = []
var width = 8
var height = 6
var lock = preload("res://scenes/piece_lock.tscn")

signal remove_lock
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# lock_pieces = make_2d_array();

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

func _on_grid_make_lock(board_position, grid_position):
	if lock_pieces.size() == 0:
		lock_pieces = make_2d_array();
	var current = lock.instantiate();
	current.position = board_position;
	var x = grid_position.x;
	var y = grid_position.y;
	lock_pieces[x][y] = current;
	add_child(current);
		


func _on_grid_damage_lock(grid_position):
	var lock_piece = lock_pieces[grid_position.x][grid_position.y];
	if lock_piece != null:
		lock_piece.take_damage(1);
		if lock_piece.health <= 0:
			lock_piece.queue_free();
			lock_pieces[grid_position.x][grid_position.y] = null;
			emit_signal("remove_lock", grid_position);
