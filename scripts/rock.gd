extends RigidBody2D

signal exploded_sig

var screensize = Vector2.ZERO
var size: float
var radius: int
var scale_factor: float = 0.2



# Need to figure this out for myself. TODO: office hours wrapping.
func _integrate_forces(physics_state: PhysicsDirectBodyState2D) -> void:
	var xform = physics_state.transform
	xform.origin.x = wrapf(xform.origin.x, 0-radius, screensize.x + radius)
	xform.origin.y = wrapf(xform.origin.y, 0 - radius, screensize.y + radius)
	physics_state.transform = xform
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func explode():
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite2D.hide()
	$Explosion/AnimationPlayer.play("explosion")  # Warning: changed nesting Thur10AM
	$Explosion.show()
	exploded_sig.emit(size, radius, position, linear_velocity)
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	await $Explosion/AnimationPlayer.animation_finished  #awaits a signal.
	queue_free()


func start(_position: Vector2, _velocity: Vector2, _size: float) -> void:
	self.position = _position
	self.size = _size
	mass = 1.5 * self.size
	$Sprite2D.scale = Vector2.ONE * scale_factor * self.size
	radius = int($Sprite2D.texture.get_size().x / 2 * $Sprite2D.scale.x)  # two vars?
	var shape: CircleShape2D = CircleShape2D.new()
	shape.radius = radius
	$CollisionShape2D.shape = shape
	linear_velocity = _velocity
	angular_velocity = randf_range(-PI, PI)
	$Explosion.scale = Vector2.ONE * 0.75 * size  # TODO: might ref wrong node?
