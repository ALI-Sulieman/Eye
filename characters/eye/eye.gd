extends CharacterBody2D

@export var player: CharacterBody2D
@export var stone_throw_margin: float = 0.4 # this is used to prevent stone from spawning inside the Eye collider, but there are other ways to do that.
@export var stone_throw_strength: float = 10.0
var hostile: bool = false
var attack_cooldown: bool = false
@onready var laser = $Laser
@onready var attack_cooldown_timer = $AttackCooldownTimer
@onready var stone_scene = preload("res://items/stone/stone.tscn")

func _physics_process(_delta):
	scout()
	attack()
		
func scout():
	laser.look_at(player.position)
	
	if laser.get_collider():
		if laser.get_collider().name == "Player":
			hostile = true
		else:
			hostile = false
	else:
		hostile = false
		
func attack():
	if not hostile or attack_cooldown:
		return
	var stone_instance = stone_scene.instantiate()
	stone_instance.position = (player.position - position) * stone_throw_margin # spwaning rock outside Eye collider but in the direction of player.
	stone_instance.impulse = (player.position - position) * stone_throw_strength
	add_child(stone_instance)
	attack_cooldown = true
	attack_cooldown_timer.start()
	


func _on_attack_cooldown_timer_timeout():
	attack_cooldown = false
