extends Area2D

#== Instance Edible ==#
@export var bullet_scene: PackedScene
@export var speed = 150
@export var rotation_speed = 120
@export var health = 3

var follow = PathFollow2D.new()
var target = null


func _on_gun_cooldown_timeout() -> void:
	pass


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
