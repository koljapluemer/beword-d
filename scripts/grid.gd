extends Node2D

# The Language Stuff
var vocab = [
	["beetroot", "بـَنجـَر", "bangar"],
	["cabbage", " كـُر ُنب", "kurunb"],
	["carrot", " جـَز َر", "gazar"],
	["cauliflower", "قـَرنـَبيط", "arnabeet"],
	["celery", " كـَر َفس", "karafs"],
	["cucumber", "خـِيا", "chiyaar"],
	["eggplant", " بـِتـِنجا َن", "bitingaen"],
	["okra", " با َميـَة", "bamya"],
	["olive", " ز َيتون", "zaytoon"],
	["onion", " بـَصـَل", "basal"],
	["pea", "بـِسـِلّـَة", "bisilla"],
	["afternoon", " بـَعد ا ِلضـُهر ", "baAd ilduhr"],
	["angry", "غـَلى", "ghala"],
	["apple", " تـُفّا َح", "tuffaeH"],
	["arm", "سـَلّـَح", "sallaH"],
	["asleep", " نا َيـِم", "naeyim"],
	["baby", " مـَولود", "mawlood"],
	["bad", "بـَطّا َل", "baTTaal"],
	["ball", " كور َة", "koora"],
	["banana", "موز", "mooz"],
	["bath", "بـَنيو", "banyw"],
	["beach", " بـِلا َج", "bilaeg"],
	["bed", " سـِرير", "sireer"],
	["bird", "طير", "Teer"],
	["black", " إسو ِد", "'iswid"],
	["blue", " أزر َق", "'azra'"],
	["boat", " مـَركـِب", "markib"],
	["book", " كـِتا َب", "kitaeb"],
	["bottle", " إزا َز َة", "'izaeza"],
	["cake", " جا َتوه", "gatooh"],
	["car", "عـَر َبـِيـَة", "Aarabiya"],
	["cat", " قـُطّـَة", "'utta"],
	["chair", " كـُرسي", "kursi"],
	["chicken", " فـِرا َخ", "firaech"],
	["child", "طـِفل", "Tifl"],
	["chocolate", "شوكولا َتـَة", "shookoolaata"],
	["city", "مـَدينـَة", "madeena"],
	["cloud", "غيم", "gheem"],
	["cow", "بـَقـَر", "ba'ar"],
	["cup", " فـِنجا َن", "fingaen"],
	["curly", "مـُمـَوّ َج", "mumawwag"],
	["cute", "ظـَريف", "zareef"],
	["dancing", " ر َقص", "ra's"],
	["dark", "مـُظلـِم", "muzlim"],
	["dog", "كـَلب", "kalb"],
	["doll", "عـَروسـَة", "Aaroosa"],
	["door", "بـَوّا َبـَة", "bawwaeba"],
	["dress", "لـَبّـِس", "labbis"],
	["duck", "بـَطّ", "baTT"],
	["ear", " و ِدن", "widn"],
	["elephant", "فيل", "feel"],
	["face", " و ِشّ", "wishsh"],
	["family", "عا َئـِلي", "Aae'ili"],
	["farm", "عـِزبـَة", "Aizba"],
	["father", "أبّ", "'abb"],
	["fish", "صا َد", "Saad"],
	["flower", "و َرد", "ward"],
	["food", "أكل", "'akl"],
	["forest", "غا َبـَة", "ghaeba"],
	["friend", "صا َحـِب", "SaaHib"],
	["fruit", "فا َكهـَة", "fakha"],
	["garden", "جـِنينـَة", "gineena"],
	["game", "لـِعبـَة", "liAba"],
	["girl", "بـِنت", "bint"],
	["glasses", " نـَضّا َر َة", "naddaara"],
	["grass", " نـِجيلـَة", "nigeela"],
	["hair", " شـَعر", "shaAr"],
	["hand", "نا َو ِل", "naewil"],
	["hat", " بـُرنيطـَة", "burneeta"],
	["head", " د ِما َغ", "dimaegh"],
	["heart", "قـَلب", "'alb"],
	["horse", "حـُصا َن", "HuSaan"],
	["house", "سـَكـَن", "sakan"],
	["insect", "حـَشـَر َة", "Hashara"],
	["jacket", "چا َكـِتّ", "jaekitt"],
	["key", "مـُفتا َح", "muftaeH"],
	["kiss", " با َس", "baes"],
	["kitchen", "مـَطبـَخ", "matbach"],
	["lamp", "لـَمبـَة", "lamba"],
	["leaf", "و َر َق", "wara'"],
	["love", "حـَبّ", "Habb"],
	["lunch", "غـَدا َء", "ghada'"],
	["moon", "قـَمـَر", "qamar"],
	["mouth", "بـُقّ", "bu''"],
	["music", "مـَزّيكا", "mazzeeka"],
	["nose", "مـَنا َخير", "manacheer"],
	["pear", "كـُمّـِترى", "kummitra"],
	["piano", "بيا َنو", "bianoo"],
	["plane", "طـَيا َر َة", "Tayaara"],
	["plant", "ز َرع", "zarA"],
	["police", "بوليس", "bolees"],
	["rain", "مـَطّـَر", "maTTar"],
	["river", "نـَهر", "nahr"],
	["robot", "أصل", "'asl"],
	["rock", "صـَخر", "Sachr"],
	["sailboat", "فـِلوكـَة", "filooka"],
	["sand", "سـَنفـَر", "sanfar"],
	["school", "مـَدر َسـَة", "madrasa"],
	["sea", "بـَحر", "baHr"],
	["ship", "شـَحـَن", "shaHan"],
	["shoe", "جـَزمـَة", "gazma"],
	["shy", "خـَجول", "chagool"],
	["sick", "ر َجّـَع", "raggaA"],
	["silly", "عـَبيط", "Aabeet"],
	["singing", "غـُنى", "ghuna"],
	["sister", "أ ُخت", "'ucht"],
	["sleeping", "نا َيـِم", "naeyim"],
	["slow", "بـَطيء", "batee'"],
	["small", "صـُغـَيـَر", "sughayar"],
	["smile", "إبتـَسّـَم", "'ibtassam"],
	["snow", "تـَلج", "talg"],
	["spider", "عـَنكـَبوت", "Aankaboot"],
	["spoon", "غـَر َف", "gharaf"],
	["sports", "ر ِيا َضـَة", "riyaada"],
	["star", "نـِجمـَة", "nigma"],
	["sun", "شـَمس", "shams"],
	["swimming", "بـِسين", "biseen"],
	["teacher", "مـُد َرّ ِس", "mudarris"],
	["tired", "هـَمدا َن", "hamdaen"],
	["tooth", "سـِنّـَة", "sinna"],
	["train", "قـَطا َر", "qataar"],
	["tree", "شـَجـَر", "shagar"],
	["tv", "تـِليڤـِزيون", "tileevizyoon"],
	["umbrella", "شـَمسـِييـَة", "shamsiyya"],
	["upset", "ز َعّـَل", "zaAAal"],
	["vegetable", "خـُضا َر", "chudaar"],
	["water", "مـَييـَه", "mayyah"],
	["wind", "ريح", "reeH"],
	["zucchini", "كوسـَة", "koosa"],
]

var possible_colors = [
	"blue",
	"green",
	"orange",
	"pink",
	"yellow",
	# "purple"
]

var vocab_prefab_dict = {}

var piece_prefab = preload ("res://scenes/piece.tscn")
var to_be_splashed = []

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

# Obstacles
@export var empty_spaces: PackedVector2Array
@export var jelly_spaces: PackedVector2Array
@export var lock_spaces: PackedVector2Array
@export var stone_spaces: PackedVector2Array

# Obstacle Signals

signal damage_jelly
signal make_jelly

signal damage_lock
signal make_lock

signal damage_stone
signal make_stone

# actual grid of pieces
var all_pieces: Array = [];
var current_matches: Array = [];
# Touch Variables
var first_touch: Vector2 = Vector2();
var second_touch: Vector2 = Vector2();
var currently_controlling_piece: bool = false;

func _ready():
	state = move;
	all_pieces = make_2d_array();
	fill_prefab_dict();
	spawn_pieces();
	spawn_jelly_pieces();
	spawn_lock_pieces();
	spawn_stone_pieces();

# Obstacle Gen

func is_in_array(arr, item):
	for i in range(arr.size()):
		if arr[i] == item:
			return true;
	return false;

func is_fill_restricted(coord):
	if is_in_array(empty_spaces, coord) or is_in_array(stone_spaces, coord):
		return true;
	return false;

func is_move_restricted(coord):
	if is_in_array(lock_spaces, coord):
		return true;
	return false;

# Spawning etc

func fill_prefab_dict():
	# randomly assign each color to a vocab array
	for i in range(possible_colors.size()):
		var vocab_index = randi() % vocab.size();
		vocab_prefab_dict[possible_colors[i]] = vocab[vocab_index];

func spawn_pieces():
	for i in width:
		for j in height:
			if not is_fill_restricted(Vector2(i, j)):
				var piece = init_piece();
				var loop_count = 0;
				while is_match_at(i, j, piece.color) and loop_count < 100:
					loop_count += 1;
					piece.queue_free();
					piece = init_piece();
				var pos = grid_to_pixel(i, j);
				piece.position = pos;
				all_pieces[i][j] = piece;
				add_child(piece);
				# with a chance, make the piece colorful
				if randi() % 1 == 0:
					piece.set_colorful();

func spawn_jelly_pieces():
	for i in jelly_spaces.size():
		var board_position_x = jelly_spaces[i].x * x_offset + x_start;
		var board_position_y = jelly_spaces[i].y * - y_offset + y_start;
		emit_signal("make_jelly", Vector2(board_position_x, board_position_y), jelly_spaces[i]);

func spawn_lock_pieces():
	for i in lock_spaces.size():
		var board_position_x = lock_spaces[i].x * x_offset + x_start;
		var board_position_y = lock_spaces[i].y * - y_offset + y_start;
		emit_signal("make_lock", Vector2(board_position_x, board_position_y), lock_spaces[i]);

func spawn_stone_pieces():
	for i in stone_spaces.size():
		var board_position_x = stone_spaces[i].x * x_offset + x_start;
		var board_position_y = stone_spaces[i].y * - y_offset + y_start;
		emit_signal("make_stone", Vector2(board_position_x, board_position_y), stone_spaces[i]);

func init_piece():
	var piece = piece_prefab.instantiate();
	var random_color_index = randi() % possible_colors.size();
	var color = possible_colors[random_color_index];
	piece.color = color;
	# set text of "word" note to the corresponding word in the vocab array
	var vocab_array = vocab_prefab_dict[color];
	var word_node = piece.get_node("word");
	var random_index = randi() % vocab_array.size();
	word_node.text = vocab_array[random_index];
	# with 1/6 chance, make the piece colorful
	if randi() % 6 == 0:
		piece.set_colorful();
	return piece;

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
		if is_within_grid(grid_pos.x, grid_pos.y):
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
		# check if the move is restricted
		if is_move_restricted(Vector2(col, row)) or is_move_restricted(Vector2(col + direction.x, row + direction.y)):
			return ;
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
	# swap pieces back that are not a match
	if piece_1 != null and piece_2 != null:
		swap_pieces(last_place.x, last_place.y, last_direction);
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

func find_bombs():
	print("------ finding bombs -----------");
	for i in current_matches.size():
		# store value for this mathc
		var current_column = current_matches[i].x;
		var current_row = current_matches[i].y;
		var current_color = all_pieces[current_column][current_row].color;
		var col_match_count = 0;
		var row_match_count = 0;
		# iterate matches again
		for j in current_matches.size():
			var this_column = current_matches[j].x;
			var this_row = current_matches[j].y;
			var this_color = all_pieces[this_column][this_row].color;
			if current_color == this_color:
				if this_column == current_column and this_row != current_row:
					col_match_count += 1;
				if this_row == current_row and this_column != current_column:
					row_match_count += 1;
		print("-------")	
		print("col match count: " + str(col_match_count));
		print("row match count: " + str(row_match_count));
		if col_match_count >= 3 and row_match_count >= 3:
			make_bomb("adjacent", current_color)
			print("adjacent bomb");
			continue;
		if col_match_count == 4:
			make_bomb("column", current_color)
			print("column bomb");
			continue
		if row_match_count == 4:
			make_bomb("row", current_color)
			print("row bomb");
			continue
		if col_match_count > 5 or row_match_count > 5:
			print("color bomb");
			continue
		print("no bomb");
	print("------ bombs finding over -----------");

func make_bomb(bomb_type, color):
	for i in current_matches.size():
		var current_column = current_matches[i].x;
		var current_row = current_matches[i].y;
		if all_pieces[current_column][current_row] == piece_1 and piece_1.color == color:
			piece_1.matched = false;
			change_bomb(bomb_type, piece_1);
		if all_pieces[current_column][current_row] == piece_2 and piece_2.color == color:
			piece_2.matched = false;
			change_bomb(bomb_type, piece_2);

func change_bomb(bomb_type, piece):
	if bomb_type == "adjacent":
		piece.make_adjacent_bomb();
	elif bomb_type == "column":
		piece.make_column_bomb()
	elif bomb_type == "row":
		piece.make_row_bomb()

func find_matches():
	to_be_splashed = [];
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
							to_be_splashed.append([i, j])
							to_be_splashed.append([i - 1, j])
							to_be_splashed.append([i + 1, j])
							current_matches.append(Vector2(i, j));
							current_matches.append(Vector2(i - 1, j));
							current_matches.append(Vector2(i + 1, j));
				# check up and down
				if j > 0 and j < height - 1:
					var other_piece_1 = all_pieces[i][j - 1];
					var other_piece_2 = all_pieces[i][j + 1];
					if other_piece_1 != null and other_piece_2 != null:
						if other_piece_1.color == current_color and other_piece_2.color == current_color:
							other_piece_1.set_matched();
							other_piece_2.set_matched();
							piece.set_matched();
							to_be_splashed.append([i, j])
							to_be_splashed.append([i, j - 1])
							to_be_splashed.append([i, j + 1])
							current_matches.append(Vector2(i, j));
							current_matches.append(Vector2(i, j - 1));
							current_matches.append(Vector2(i, j + 1));
	# immediately color the matched pieces
	for pos in to_be_splashed:
		var piece = all_pieces[pos[0]][pos[1]];
		if piece != null:
			piece.set_colorful();
	get_bombed_pieces();
	get_parent().get_node("destroy_timer").start();


func get_bombed_pieces():
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece != null:
				if piece.matched:
					if piece.is_column_bomb:
						match_all_in_col(i);
					elif piece.is_row_bomb:
						match_all_in_row(j);
					elif piece.is_adjacent_bomb:
						find_adjacent_pieces(i, j);


func destroy_matched():
	find_bombs();
	var was_matched = false;
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece != null:
				if piece.matched:
					was_matched = true;
					piece.queue_free();
					all_pieces[i][j] = null;
					emit_signal("damage_jelly", Vector2(i, j));
					emit_signal("damage_lock", Vector2(i, j));
					check_for_stone_damage(i, j);
	move_checked = true;
	if was_matched:
		get_parent().get_node("collapse_timer").start();
	else:
		swap_back();
	splash(to_be_splashed);
	current_matches.clear();

func check_for_stone_damage(col, row):
	# Check Right
	if col < width - 1:
		emit_signal("damage_stone", Vector2(col + 1, row));
	# Check Left
	if col > 0:
		emit_signal("damage_stone", Vector2(col - 1, row));
	# Check Up
	if row < height - 1:
		emit_signal("damage_stone", Vector2(col, row + 1));
	# Check Down
	if row > 0:
		emit_signal("damage_stone", Vector2(col, row - 1));

func splash(to_be_splashed_from):
	# randomly splash on pieces around the matched positions
	for i in to_be_splashed_from:
		var col = i[0];
		var row = i[1];
		# random offset from -2 to 2
		var x_splash_offset = randi() % 5 - 2;
		var y_splash_offset = randi() % 5 - 2;
		if is_within_grid(col + x_splash_offset, row + y_splash_offset):
			if all_pieces[col + x_splash_offset][row + y_splash_offset] != null:
				all_pieces[col + x_splash_offset][row + y_splash_offset].set_colorful();

func collapse_cols():
	for i in width:
		for j in height:
			var piece = all_pieces[i][j];
			if piece == null and not is_fill_restricted(Vector2(i, j)):
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
			if all_pieces[i][j] == null and not is_fill_restricted(Vector2(i, j)):
				var piece = init_piece();
				add_child(piece);
				piece.set_colorful();
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

func _on_holder_lock_remove_lock(pos):
	for i in range(lock_spaces.size() - 1, -1, -1):
		if lock_spaces[i] == pos:
			lock_spaces.remove_at(i);
			break ;

func _on_holder_stone_remove_stone(pos):
	for i in range(stone_spaces.size() - 1, -1, -1):
		if stone_spaces[i] == pos:
			stone_spaces.remove_at(i);
			break ;

func match_all_in_col(col, depth = 0):
	if depth > 5:
		return ;
	for i in height:
		var piece = all_pieces[col][i];
		if piece != null:
			piece.matched = true;
			if piece.is_row_bomb:
				match_all_in_row(i, depth + 1);
			if piece.is_adjacent_bomb:
				find_adjacent_pieces(col, i, depth + 1);

func match_all_in_row(row, depth = 0):
	if depth > 5:
		return ;
	for i in width:
		var piece = all_pieces[i][row];
		if piece != null:
			piece.matched = true;
			if piece.is_column_bomb:
				match_all_in_col(i, depth + 1);
			if piece.is_adjacent_bomb:
				find_adjacent_pieces(i, row, depth + 1);

func find_adjacent_pieces(col, row, depth = 0):
	if depth > 5:
		return ;
	for i in range(col - 1, col + 2):
		for j in range(row - 1, row + 2):
			if is_within_grid(i, j):
				var piece = all_pieces[i][j];
				if piece != null:
					piece.matched = true;
					if piece.is_column_bomb:
						match_all_in_col(i, depth + 1);
					if piece.is_row_bomb:
						match_all_in_row(j, depth + 1);
