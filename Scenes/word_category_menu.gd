extends Control

func scene_button_pressed(extra_arg_0: String):
	var path = str("res://Scenes/", extra_arg_0,".tscn")
	get_tree().change_scene_to_file(path)


func _on_exit_button_pressed():
	get_tree().quit()
