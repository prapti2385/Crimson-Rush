extends CharacterBody2D

@onready var happy_boo: Node2D = %HappyBoo
var health = 100.0
@onready var hurt_box: Area2D = %HurtBox
signal health_depleted
@onready var progress_bar: ProgressBar = $ProgressBar


func _physics_process(delta: float) -> void:
	const SPEED = 600
	var direction = Input.get_vector("move_left","move_right","move_up","move_down");
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0.0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		progress_bar.value = health
	if health <= 0.0:
		health_depleted.emit()
		
		
	
