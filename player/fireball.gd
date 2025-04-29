extends Area2D

var speed: int = 600
@export var direction: Vector2
@onready var time: Timer = $Timer

func _ready() -> void:
	time.start()
	
func _process(delta: float) -> void:
	position += speed * direction * delta

func _on_timer_timeout() -> void:
	queue_free()# Replace with function body.
