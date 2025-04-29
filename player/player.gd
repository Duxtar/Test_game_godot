extends CharacterBody2D

var can_shoot: bool = 1
var can_grenade: bool = 1
const speed: int = 300
const acel: int = 50
const friction: int = 100
signal fireball(position, view_direction)
signal grenade(position, view_direction)

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	var projectile_markers = $player_sprite/weapon/positions.get_children()
	var random_pos = projectile_markers.pick_random().global_position
	var view_direction: Vector2 = (get_global_mouse_position() - position).normalized()
	if view_direction == Vector2.ZERO:
		view_direction = Vector2.UP
	var weapon: Sprite2D = $player_sprite/weapon
	#print(view_direction)
	#weapon.look_at(get_global_mouse_position())
	weapon.position = view_direction * 10
	velocity = velocity.move_toward(speed * direction,  acel)
	if direction == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	move_and_slide()
	if Input.is_action_pressed("shoot") and can_shoot:
		can_shoot = 0
		$Shoot_time.start()
		fireball.emit(random_pos, view_direction)
	if Input.is_action_just_pressed("grenade") and can_grenade: 
		#var projectile_markers = $player_sprite/weapon/positions.get_children()
		can_grenade = 0
		$Grenade_time.start()
		grenade.emit(random_pos, view_direction)
	#if Input.is_action_just_pressed("grenade"):
		#print($Grenade_time.time_left)

func _on_shoot_time_timeout(): #shoot
	can_shoot=1 # Replace with function body.


func _on_grenade_time_timeout():
	can_grenade=1 # Replace with function body.
