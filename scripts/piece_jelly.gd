extends Node2D

@export var health:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(damage:int):
	health -= damage
	# Can add damage effect (TODO)
