extends Node2D

const speed: int = 300;
var fireball_scene: PackedScene = preload("res://player/fireball.tscn")
var grenade_scene: PackedScene = preload("res://player/grenade.tscn")

func _on_bed_player_enter(body):
	$decore/Bed.modulate = Color(0, 0, 0.0) # Replace with function body.

func _on_bed_player_exit(body):
	$decore/Bed.modulate = Color(1.0, 0.584, 0.0) # Replace with function body.


func _on_player_fireball(pos, view_direction) -> void:
	var fireball: Area2D = fireball_scene.instantiate()
	$projectiles.add_child(fireball)
	fireball.position = pos
	fireball.direction = view_direction
	fireball.look_at(get_global_mouse_position())
	pass # Replace with function body.


func _on_player_grenade(pos, view_direction) -> void:
	var grenade: RigidBody2D = grenade_scene.instantiate()
#	var grenade = grenade_scene.instantiate() as RigidBody2D
	$projectiles.add_child(grenade)
	grenade.position = pos 
	grenade.linear_velocity = view_direction * 1000
	pass # Replace with function body.
