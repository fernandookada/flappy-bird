extends Control

@onready var stats = %Stats

func _ready():
	hide()
	EventBus.game_finished.connect(_on_game_finished)

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
	
func _on_game_finished(score : int, max_score : int) -> void:
		stats.text = str("Pontuação: ", score, "\nRecorde: ", max_score)
		#stats.text = "Pontuação: " + str(score)
		#stats.text = "Pontuação: %s\nRecorde: " % [str(score), str(max_score)]
		show()
