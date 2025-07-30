extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"


func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position);
	velocity = direction * 300.0
	move_and_slide()
	
