extends CharacterBody2D

var speed: int = 50
var direction = Vector2.RIGHT
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	$Timer.start()
	
func _process(delta):
	velocity = speed * direction; 
	move_and_slide()
	$AnimatedSprite2D.play("running")


func _on_timer_timeout() -> void:
	anim.scale.x = -anim.scale.x
	direction = -direction # Replace with function body.
	$Timer.start()
