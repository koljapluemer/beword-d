extends Node

var score = 0
@onready var score_label_button = $%UI/HBoxContainer/ScoreLabelButton

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label_button.text = "Points: " + str(score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_points_to_score(points):
	score += points
	score_label_button.text = "Points: " + str(score)
	
		
