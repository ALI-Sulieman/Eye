extends RigidBody2D

var target_position: Vector2
var impulse: Vector2 = Vector2.ZERO

func _ready():
	look_at(target_position)
	apply_central_impulse(impulse)

func _on_destruction_timer_timeout():
	queue_free()
