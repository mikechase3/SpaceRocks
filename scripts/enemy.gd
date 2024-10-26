extends Area2D

#== Instance Edible ==#
@export var bullet_scene: PackedScene
@export var bullet_spread = 0.2
@export var speed = 150
@export var rotation_speed = 120
@export var health = 3



var follow = PathFollow2D.new()
var target = null

func _on_body_entered(body):
	if body.is_in_group("rocks"):
		return
	elif body.is_in_group("players"):
		#print("At Enemey._on_body_entered: Body's shield is %s before subtracting" % body.shield)
		body.shield = body.shield - 50
		#print("At Enemey._on_body_entered: Body's shield is %s after subtracting" % body.shield)

		explode()


func _on_gun_cooldown_timeout() -> void:
	#shoot()
	#d: float = randf(0.1, 0.8)
	var d: float = randf_range(0.1, 1.5)
	shoot_pulse(3, d)


func _process(delta: float) -> void:
	pass


func _ready() -> void:
	$Sprite2D.frame = randi() % 3
	var path = $EnemyPaths.get_children()[randi() % $EnemyPaths.get_child_count()]
	path.add_child(follow)
	follow.loop = false

func _physics_process(delta):
	rotation += deg_to_rad(rotation_speed) * delta
	follow.progress += speed * delta
	position = follow.global_position  # inherited from node2d
	
	if follow.progress_ratio >= 1:
		queue_free()

func explode():
	speed = 0
	$GunCooldown.stop()
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite2D.hide()
	$Explosion.show()
	$Explosion/AnimationPlayer.play("explosion")
	$ExplosionSound.play()
	await $Explosion/AnimationPlayer.animation_finished
	queue_free()
	


func shoot():
	var dir = global_position.direction_to(target.global_position)
	dir = dir.rotated(randf_range(-1 * bullet_spread, bullet_spread))
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(global_position, dir)

func take_damage(amount):
	health -= amount
	$AnimationPlayer.play("flash")
	if health <= 0:
		explode()
	
func shoot_pulse(n, delay):
	for i in n:  # like i=0; i < n; i++ where n is an iterable with delay sections btw them.
		shoot()
		$ShootSound.play()
		await get_tree().create_timer(delay).timeout  # Makes a timer. Acts upon being timed out.
		
