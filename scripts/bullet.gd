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
	#print("bullet body intersected:  " + body.name)
	if body.is_in_group("rocks"):
		body.explode()
		queue_free()
	#if body.is_in_group("enemies"):  # DOESNT GET CALLED
		#body.take_damage(1)  # in enemy script.
		
func _on_area_entered(area):
	print("bullet body intersected %s" % area.name)
	if area.is_in_group("enemies"):
		area.take_damage(1)
		queue_free()
