extends CharacterBody2D

@onready var laser = $Laser
@export var player: CharacterBody2D

func _physics_process(delta):
	laser.look_at(player.position)
