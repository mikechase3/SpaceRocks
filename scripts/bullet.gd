extends Area2D

############## GLOBAL VARS ################3
@export var speed: int = 1000


var velocity = Vector2.ZERO


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()  # Delete it safely. 

func _process(delta):
	position += velocity * delta

func start(_transform):
	transform = _transform  # builtin property nodes. Overwriting built in property.
	velocity = transform.x * speed


func _on_bullet_body_entered(body: Node2D) -> void:
	if body.is_in_group("rocks"):
		body.explode()
		queue_free()
