extends RigidBody2D

var impulse: Vector2 = Vector2.ZERO

func _ready():
	apply_central_impulse(impulse)

func _on_destruction_timer_timeout():
	queue_free()
