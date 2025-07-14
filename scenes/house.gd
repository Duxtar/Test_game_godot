extends Area2D

signal bed_player_enter()
signal bed_player_exit()

func _on_bed_player_enter(body: Variant) -> void:
	emit_signal("bed_player_enter")
	pass # Replace with function body.


func _on_bed_player_exit(body: Variant) -> void:
	emit_signal("bed_player_exit")
	pass # Replace with function body.
