extends StaticBody2D

signal player_enter(body)
signal player_exit(body)

func _on_area_2d_body_entered(body):
	player_enter.emit(body)


func _on_area_2d_body_exited(body):
	player_exit.emit(body) # Replace with function body.
