extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

signal died

var alive: bool = true

func _physics_process(delta):
	velocity.y += get_gravity().y * 0.05
	
	if alive == true:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -1000	* 0.6
	move_and_slide()
	
	if velocity.y < 0:
		animated_sprite.play("Plane-up")
	else:
		animated_sprite.play("Plane-down")
	
	if get_last_slide_collision() != null:
		game_over()


func _on_screen_exited():
	game_over()


func game_over() -> void:
	if alive == true:
		died.emit()
	alive = false
