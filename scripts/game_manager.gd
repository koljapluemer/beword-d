extends Node

var score = 0
var obstacle_counter = 0

@onready var score_label_button = %UI/HBoxContainer/ScoreLabelButton
@onready var obstacles_remaining_label_button = %UI/HBoxContainer/ObstaclesRemainingLabelButton

# Called when the node enters the scene tree for the first time.
func _ready():
	render_ui()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_points_to_score(points):
	score += points
	render_ui()
	
	
func render_ui():
	score_label_button.text = "Points: " + str(score)	
	obstacles_remaining_label_button.text = "Obstacles Remaining: " + str(obstacle_counter)
	
		
func change_obstacle_counter(by):
	# see that not over 12
	obstacle_counter = max(0, min(12, obstacle_counter + by))
	# if 0, game over, restart
	if obstacle_counter == 0:
		get_tree().reload_current_scene()
	if score_label_button:
		render_ui()	


 
