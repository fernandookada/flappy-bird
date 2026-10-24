extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_fullscreen_pressed():
	get_window().mode = Window.MODE_FULLSCREEN
