extends Node2D

# State Machine

enum {wait, move}
var state

# Swapping Back
var piece_1 = null;
var piece_2 = null;
var last_place = Vector2();
var last_direction = Vector2();
var move_checked = false;

# Grid Variables for Main Game Grid
@export var width: int;
@export var height: int;
@export var x_start: int;
@export var y_start: int;
@export var x_offset: int;
@export var y_offset: int;

@export var drop_offset: int;

# Pieces we can spawn
var possible_pieces = [
	preload ("res://scenes/blue_piece.tscn"),
	preload ("res://scenes/green_piece.tscn"),
	preload ("res://scenes/orange_piece.tscn"),
	preload ("res://scenes/pink_piece.tscn"),
	preload ("res://scenes/yellow_piece.tscn")
]
# actual grid of pieces
var all_pieces: Array = [];
# Touch Variables
var first_touch: Vector2 = Vector2();
var second_touch: Vector2 = Vector2();
var currently_controlling_piece: bool = false;

func _ready():
	state = move;
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
	if state == move:
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
		# check if there is a cell at the destination (even if it's not a neighbor )
		# don't use the actual position as direction indication, but the "hovered" cell
		var first_touched_cell = all_pieces[pixel_to_grid(first_touch.x, first_touch.y).x][pixel_to_grid(first_touch.x, first_touch.y).y];
		var second_touched_cell = all_pieces[grid_pos.x][grid_pos.y];
		# ignore moves on the same cell
		if first_touched_cell != second_touched_cell:
			# first_touched_cell.set_matched()
			# second_touched_cell.set_matched()
			if second_touched_cell != null and currently_controlling_piece:
				var grid_1 = pixel_to_grid(first_touch.x, first_touch.y);
				var grid_2 = pixel_to_grid(second_touch.x, second_touch.y);
				touch_difference(grid_1, grid_2);
		currently_controlling_piece = false;

func swap_pieces(col, row, direction):
	var first_piece = all_pieces[col][row];
	var second_piece = all_pieces[col + direction.x][row + direction.y];
	# null check
	if first_piece != null and second_piece != null:
		store_swap_info(first_piece, second_piece, Vector2(col, row), direction);
		state = wait;
		all_pieces[col][row] = second_piece;
		all_pieces[col + direction.x][row + direction.y] = first_piece;
		var first_pos = first_piece.position;
		var second_pos = second_piece.position;
		first_piece.move(second_pos);
		second_piece.move(first_pos);
		if not move_checked:
			find_matches();

func store_swap_info(first_piece, second_piece, place, direction):
	piece_1 = first_piece;
	piece_2 = second_piece;
	last_place = place;
	last_direction = direction;

func swap_back():
	print("swapping back");
	# swap pieces back that are not a match
	if piece_1 != null and piece_2 != null:
		swap_pieces(last_place.x, last_place.y, last_direction);
		print("swapped back");
	state = move
	move_checked = false;


func touch_difference(grid_1, grid_2):
	var difference = grid_2 - grid_1;
	if abs(difference.x) > abs(difference.y):
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1, 0));
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2( - 1, 0));
	elif abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, 1));
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, -1));

# Helper Functions

func grid_to_pixel(col, row):
	var x = x_start + col * x_offset;
	var y = y_start + row * - y_offset;
	return Vector2(x, y);

func pixel_to_grid(x, y):
	var col = round((x - x_start) / x_offset);
	var row = round((y - y_start) / - y_offset);
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
		if all_pieces[col - 1][row] != null and all_pieces[col - 2][row] != null:
			if all_pieces[col - 1][row].color == color and all_pieces[col - 2][row].color == color:
				return true;
	# checking down
	if row > 1:
		if all_pieces[col][row - 1] != null and all_pieces[col][row - 2] != null:
			if all_pieces[col][row - 1].color == color and all_pieces[col][row - 2].color == color:
				return true;
	return false;

# Matches

func find_matches():
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece != null:
				var current_color = piece.color;
				# check left and right
				if i > 0 and i < width - 1:
					var other_piece_1 = all_pieces[i - 1][j];
					var other_piece_2 = all_pieces[i + 1][j];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
				# check up and down
				if j > 0 and j < height - 1:
					var other_piece_1 = all_pieces[i][j - 1];
					var other_piece_2 = all_pieces[i][j + 1];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
				# check to the top
				if i > 1:
					var other_piece_1 = all_pieces[i - 1][j];
					var other_piece_2 = all_pieces[i - 2][j];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
				# check to the bottom
				if i < width - 2:
					var other_piece_1 = all_pieces[i + 1][j];
					var other_piece_2 = all_pieces[i + 2][j];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
				# check to the left
				if j > 1:
					var other_piece_1 = all_pieces[i][j - 1];
					var other_piece_2 = all_pieces[i][j - 2];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
				# check to the right
				if j < height - 2:
					var other_piece_1 = all_pieces[i][j + 1];
					var other_piece_2 = all_pieces[i][j + 2];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
	get_parent().get_node("destroy_timer").start();

func destroy_matched():
	var was_matched = false;
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece != null:
				if piece.matched:
					was_matched = true;
					piece.queue_free();
					all_pieces[i][j] = null;
	move_checked = true;
	if was_matched:
		get_parent().get_node("collapse_timer").start();
	else: 
		swap_back();

func collapse_cols():
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece == null:
				for k in range(j + 1, height):
					var other_piece = all_pieces[i][k];
					if other_piece != null:
						all_pieces[i][j] = other_piece;
						all_pieces[i][k] = null;
						other_piece.move(grid_to_pixel(i, j));
						break ;
	get_parent().get_node("refill_timer").start();

func refill_columns():
	for i in width:
		for j in height:
			if all_pieces[i][j] == null:
				var piece = possible_pieces[randi() % possible_pieces.size()].instantiate();
				add_child(piece);
				piece.position = grid_to_pixel(i, j + drop_offset);
				piece.move(grid_to_pixel(i, j));
				all_pieces[i][j] = piece;
	# get_parent().get_node("destroy_timer").start();
	check_after_refill();

func check_after_refill():
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece != null:
				if is_match_at(i, j, piece.color):
					find_matches();
					get_parent().get_node("destroy_timer").start();
					return
	state = move
	move_checked = false;

func _on_destroy_timer_timeout():
	destroy_matched()

func _on_collapse_timer_timeout():
	collapse_cols()

func _on_refill_timer_timeout():
	refill_columns()
