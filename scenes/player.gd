extends RigidBody2D

@export var engine_power = 500
@export var spin_power = 8000

enum {INIT, ALIVE, INVULNERABLE, DEAD}  # these aren't strings? What is data type?
var state = INIT
var thrust = Vector2.ZERO
var rotation_dir = 0

func _process(delta):
	get_input()
	#shield += shield_regen * delta

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



	
func get_input():
	$Exhaust.emitting = false
	if state in [DEAD, INIT]:
		return
	if Input.is_action_pressed("thrust"):
		thrust = transform.x * engine_power
		$Exhaust.emitting = true
		if not $EngineSound.playing:
			$EngineSound.play()
	else:
		$EngineSound.stop()
	rotation_dir = Input.get_axis("rotate_left", "rotate_right")
	#if Input.is_action_pressed("shoot") and can_shoot:
		#shoot()
		
func _physics_process(delta):
	constant_force = thrust
	constant_torque = rotation_dir * spin_power
