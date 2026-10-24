extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):
	velocity.y += get_gravity().y * 0.05
	if Input.is_action_just_pressed("jump"):
		velocity.y = -1000	* 0.6
	move_and_slide()
	
	if velocity.y < 0:
		animated_sprite.play("Plane-up")
	else:
		animated_sprite.play("Plane-down")
	
	if get_last_slide_collision() != null:
		get_tree().reload_current_scene() # TODO: trocar por tela de game over


func _on_screen_exited():
	get_tree().reload_current_scene()
