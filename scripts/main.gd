extends Node


@export var rock_scene: PackedScene
@export var enemy_scene: PackedScene

var screensize = Vector2.ZERO
var level: int = 0
var score: int = 0
var playing: bool = false

func _input(event):
	if event.is_action_pressed("pause"):
		if not playing:
			return
			
		get_tree().paused = not get_tree().paused  # ERR
		var message = $HUD/VBoxContainer/Message
		if get_tree().paused:
			message.text = "Paused"
			message.show()
		else:
			message.text = ""
			message.hide()

func _on_enemy_timer_timeout() -> void:
	var e = enemy_scene.instantiate()
	add_child(e)
	e.target = $Player
	$EnemyTimer.start(randf_range(20, 40))
	

func _on_hud_start_game() -> void:
	new_game()

func _on_player_dead() -> void:
	game_over()


func _on_rock_exploded(size, radius, pos, vel):
	if size <= 1:
		return
	else:
		for offset in [-1, 1]:  #wut?
			var dir = $Player.position.direction_to(pos).orthogonal() * offset
			var newpos = pos + dir * radius
			var newvel = dir * vel.length() * 1.1
			spawn_rock(size - 1, newpos, newvel)

func _process(delta):
	if not playing:
		return
	
	if get_tree().get_nodes_in_group("rocks").size() == 0:
		new_level()

func _ready():
	screensize = get_viewport().get_visible_rect().size
	#for i in range(3):
		#spawn_rock(3)
		
func game_over():
	playing = false
	$HUD.game_over()
	

func new_game():
	# remove any old rocks from previous game     
	get_tree().call_group("rocks", "queue_free")     
	level = 0
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready!")
	$Player.reset()
	await $HUD/Timer.timeout
	playing = true
	
func new_level():
	level += 1
	var numRocksToSpawn: int = 2+level
	$HUD.show_message("Wave %s" % level)
	for i in numRocksToSpawn:
		print("Spawning level")
		spawn_rock(3)  #size=3, not three times
		
	$EnemyTimer.start(randf_range(5, 10))
	


	
# Function to spawn a rock at a specific position and velocity
func spawn_rock(size=3, pos=null, vel=null):
	# If no position is provided, set a random progress value and use the RockSpawn's position
	if pos == null:
		# Set the progress of RockSpawn to a random integer
		$RockPath/RockSpawn.progress = randi()  
		# Get the position of RockSpawn
		pos = $RockPath/RockSpawn.position 
   
	# If no velocity is provided, calculate a random velocity
	if vel == null:
		# Create a velocity vector that rotates a right vector by a random angle and scales it by a random value
		vel = Vector2.RIGHT.rotated(randf_range(0, TAU)) * randf_range(50, 125) 
		
	# Instantiate a new rock scene
	var r = rock_scene.instantiate()  
	
	# Assign the screen size to the rock instance (r)
	r.screensize = screensize 
	
	# Start the rock with the defined position, velocity, and size
	r.start(pos, vel, size) 
	
	# Defer adding the rock to the scene tree to ensure it is added correctly
	call_deferred("add_child", r)  

	r.exploded_sig.connect(self._on_rock_exploded)  # I named my sig differently in rock.gd
	
