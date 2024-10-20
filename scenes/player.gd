extends RigidBody2D

@export var engine_power = 500
@export var spin_power = 8000

enum {INIT, ALIVE, INVULNERABLE, DEAD}  # these aren't strings? What is data type?
var state = INIT
var thrust = Vector2.ZERO
var rotation_dir = 0
var screensize = Vector2.ZERO  # Book/Slide says Vector.ZERO

func _integrate_forces(physics_state):
	var xform = physics_state.transform
	xform.origin.x = wrapf(xform.origin.x, 0, screensize.x)
	xform.origin.y = wrapf(xform.origin.y, 0, screensize.y)
	physics_state.transform = xform
	
	

func _process(delta):
	get_input()
	#shield += shield_regen * delta

func _ready():
	change_state(ALIVE)
	screensize = get_viewport_rect().size
	#print(transform)  # is this a builtin? WOW IT IS!!! 


func _physics_process(delta):
	constant_force = thrust
	constant_torque = rotation_dir * spin_power


func change_state(new_state):
	match new_state:
		INIT:
			$CollisionShape2d.set_deferred("disabled", true)
			#$Sprite2d.modulate.a = 0.5  # Not yet
		ALIVE:
			$CollisionShape2d.set_deferred("disabled", false)
			#$Sprite2d.modulate.a = 1.0
		INVULNERABLE:
			$CollisionShape2d.set_deferred("disabled", true)
			#$Sprite2d.modulate.a = 0.5
			#$InvulnerabilityTimer.start()
		DEAD:
			$CollisionShape2d.set_deferred("disabled", true)
			#$Sprite2d.hide()
			#$EngineSound.stop()
			#linear_velocity = Vector2.ZERO
			#dead.emit()
	state = new_state
	print("test")



	
func get_input():
	thrust = Vector2.ZERO  # bug fixed - need it here.
	#$Exhaust.emitting = false
	if state in [DEAD, INIT]:
		return
	if Input.is_action_pressed("thrust"):
		thrust = transform.x * engine_power
		#$Exhaust.emitting = true
		#if not $EngineSound.playing:
			#$EngineSound.play()
	else:
		pass
		#$EngineSound.stop()
	rotation_dir = Input.get_axis("rotate_left", "rotate_right")
	#if Input.is_action_pressed("shoot") and can_shoot:
		#shoot()
		
