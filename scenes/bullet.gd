extends Area2D

@export var speed = 1000

var velocity = Vector2.ZERO

func _process(delta):
	position += velocity * delta

func start(_transform):
	transform = _transform  # builtin property nodes. Overwriting built in property.
	velocity = transform.x * speed
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()  # Delete it safely. 
