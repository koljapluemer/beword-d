extends Node2D

# Grid Variables for Main Game Grid
@export var width: int;
@export var height: int;
@export var x_start: int;
@export var y_start: int;
@export var offset: int;


# Pieces we can spawn
var possible_pieces = [
	preload("res://scenes/blue_piece.tscn"),
	preload("res://scenes/green_piece.tscn"),
	preload("res://scenes/orange_piece.tscn"),
	preload("res://scenes/pink_piece.tscn"),
	preload("res://scenes/yellow_piece.tscn")
]
# actual grid of pieces
var all_pieces: Array = [];
# Touch Variables
var first_touch: Vector2 = Vector2();
var second_touch: Vector2 = Vector2();
var currently_controlling_piece: bool = false;


func _ready():
	all_pieces = make_2d_array();
	spawn_pieces();


func spawn_pieces():
	for i in width:
		for j in height:
			var piece = possible_pieces[randi() % possible_pieces.size()].instantiate();
			var loop_count = 0;
			while is_match_at(i, j, piece.color) and loop_count < 100:
				loop_count += 1;
				piece.queue_free();
				piece = possible_pieces[randi() % possible_pieces.size()].instantiate();
			var pos = grid_to_pixel(i, j);
			piece.position = pos;
			all_pieces[i][j] = piece;
			add_child(piece);

func _process(delta):
	touch_input();


# Touch

func touch_input():
	if Input.is_action_just_pressed("ui_touch"):
		var touch = get_global_mouse_position();
		var touched_cell = pixel_to_grid(touch.x, touch.y);
		first_touch = touch;
		if is_within_grid(touched_cell.x, touched_cell.y):
			currently_controlling_piece = true;
	if Input.is_action_just_released("ui_touch"):
		second_touch = get_global_mouse_position();
		var grid_pos = pixel_to_grid(second_touch.x, second_touch.y);
		if is_within_grid(grid_pos.x, grid_pos.y) and currently_controlling_piece:
			touch_difference(pixel_to_grid(first_touch.x, first_touch.y), grid_pos);
			currently_controlling_piece = false;

func swap_pieces(col, row, direction):
	var first_piece = all_pieces[col][row];
	var second_piece = all_pieces[col + direction.x][row + direction.y];
	all_pieces[col][row] = second_piece;
	all_pieces[col + direction.x][row + direction.y] = first_piece;
	var first_pos = first_piece.position;
	var second_pos = second_piece.position;
	first_piece.move(second_pos);
	second_piece.move(first_pos);

func touch_difference(grid_1, grid_2):
	var difference = grid_2 - grid_1;
	if abs(difference.x) > 1 or abs(difference.y) > 1:
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1, 0));
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(-1, 0));
	elif abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, 1));
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, -1));		



# Helper Functions

func grid_to_pixel(col, row):
	var x = x_start + col * offset;
	var y = y_start + row * -offset;
	return Vector2(x, y);

func pixel_to_grid(x, y):
	var col = round((x - x_start) / offset);
	var row = round((y - y_start) / -offset);
	return Vector2(col, row);

func is_within_grid(col, row):
	return col >= 0 and col < width and row >= 0 and row < height;


func make_2d_array():
	var arr = [];
	for i in width:
		arr.append([]);
		for j in height:
			arr[i].append(null);
	return arr;

func is_match_at(col, row, color):
	# checking to the left
	if col > 1:
		if all_pieces[col-1][row] != null and all_pieces[col-2][row] != null:
			if all_pieces[col-1][row].color == color and all_pieces[col-2][row].color == color:
				return true;
	# checking down
	if row > 1:
		if all_pieces[col][row-1] != null and all_pieces[col][row-2] != null:
			if all_pieces[col][row-1].color == color and all_pieces[col][row-2].color == color:
				return true;
	return false;
