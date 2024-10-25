# Investigating the Existing Code
Before really getting started - let's see how this works.

## Game Elements Overview
1. A HUD where you press start: score counter. Shields & progress bar too.
2. Kick-ass music.
3. A mapping for the ship to go forward. 
4. Waves. Upon hitting an aestroid, it splits into 2. After smallest it vanishes to dust.
5. An emeny player.

So if I were to design this now from scratch I'd do:
- [ ] Make the ship player scene.
  - [ ] Load the sprite for idle, left booster, right booster.
  - [ ] Map key bindings
  - [ ] Establish a rigid body.

And at this point - let's just open up the player. (Just kidding... did that first and went back to main)


## The Main Script
The main game has a background, player, rockPath (and RockSpawn nested under it?), HUD, EnemyTimer, and three sounds.
- Background: has no sceneattached. It's a Sprite2D, a "general-purpose sprite node". Displays a 2D texture.
  - Methods: get_rect()-> const? & `bool is_pixel_opaque(pos: V3ector2) const`.
  - Signals: `frame_changed()` and `texture_changed()` when things happen.
- Class `player.gd` inherits from RigidBody2D, PhysicsBody, CollisionObject2D, Node2D, CanvasItem, Node, and Object.
  - [ ] Custom Signals: `dead()`, `lives_changed()`, and `body_entered(body: Node)` isn't a custom one but comes from RigidBody2D.
	- [ ] `dead()` in the signal from `player.gd` informs `main.game_over()` that we died I guess. game_over does hud/music stuff.
	- [ ] `lives_changed()` should tell the HUD to `update_lives()` on the `hud.gd` script in its `update_lives(value)` function.
  - [ ] Player's RigidBody2D component has a `_on_player_body_entered()` script that'll report to `player.gd._on_player_body_entered(body)`
	- [ ] Is that what Stiffler means with 'internal' gets a `_` prepended to it? 
	- [ ] The player sends the signal & the same class's script does something with it? (in this case, split rock size)
- [ ] RockPath is a spline called a `Curve2D` with a path?: `res://main.tscn::Curve2D_jejaf`
  - [ ]  Defined are a bunch of points in probably a rectangle.
  - [ ] Contains a Curve2D path for PathFollow2D nodes to follow according to docs.
  - [ ] Curves should start with a zero vecotr.
  - [ ] The RockSpawn child scene contains the PathFollow2D node and a Node2D? (A WHOLE NODE2D crazy). This doesn't define the path.
	- [ ] Oddly, the transform position is set to 1152px w/ a 90 deg rotation. Adjusting it didn't move anything apparent in editor.
- [ ] HUD: signals when `new_game()` button is pressed probably and is received on `main.gd` Shows "Space Rocks"
- [ ] Enemy Timer: 
  - [ ] There's an `enemy.gd` and `eney.tscn` tyhat this might have something to do with. (But I'm surprised no enemy is nested)
	- [ ] I wonder if we probably 'spawn' the enemy dynamically.
  - [ ] It inherits from `class Timer` so it shuold be simple. `Timer` -> `Node` -> `Object` is the inheritance tree.
  - [ ] Emits the **signal timeout()** function when timer reaches the end. 
  - [ ] Methods are `bool is_stopped()`, `void start(time_sec: float = -1)`, and `void stop()`
  - [ ] Upon `_on_enemy_timer_timeout()` it looks like we instantiate a new enemy `e` scene that targets the player and starts again.
- [ ] AudioStreamPlayers. Nodes for audio playback that we did in the last project.




## The Player 
- [ ]  sends a `_on_player_body_entered()` signal to the `player.gd` script to reduce the shield & make explode effect
- [ ] Sprite2d? Surprisingly not an AnimatedSprite2D.
  * We're not using particle effects are we? 
  - [ ] Put a texture into the texture slot w/ the asset.
  - [ ] Rotate it 90 degrees - probably for future steps.
  - [ ] Scale it down to 0.5
  - [ ] Don't attach a script to that - we'll probably do it to the whole player.
  - [x] Remember - access child components with `$`? And upstream, use signals?
- [ ]  CollisionShape2D: a circle shape. Rather simple.
- [ ]  A `Muzzle` of type `Marker2D`. Docs say it's a position hint for editing. 
  - [x] "it's like a plain Node2D but it displays as a cross in the 2D editor at all times.
  - [ ] Set position vector to 50px to the right. Where it's heading direction is.
4. GunCooldown timer. A delay before the next firing probably?


## What is set deferred - Stiffler Q?
In Godot, `set_deferred()` is a method that's used to schedule changes on a node to be applied at the end of the current frame, rather than applying them immediately. This can be important for ensuring that certain operations can be safely performed without causing issues with the current state of the scene or the engine's processing order.

### Purpose of `set_deferred()`
1. **Safe Node State Changes**: It allows you to safely modify a property of a node that might be actively being used or drawn. This is crucial in scenarios where a node's state may be relied upon during the current frame.
2. **Performance Improvements**: In certain cases, delaying changes until the end of a frame can help in cases where multiple changes are made that could trigger unnecessary recalculations or updates immediately.

### Common Use with Collision Shapes
When dealing with collision shapes, you'll often use `set_deferred()` if you're dynamically adding or removing collision shapes or when modifying properties that affect collision detection (like expanding or shrinking).

### Example Scenario: Space Rocks
Imagine you're creating a game where you have asteroids (space rocks) that can collide with other objects. Let's say you want to change the collision shape of an asteroid when it breaks apart after a collision. 

Here's how you might use `set_deferred()` in a method that handles this situation:

```gdscript
# SpaceRock.gd

class_name SpaceRock
extends Area2D

# Assuming you have a CollisionShape2D node as a child
onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _on_collision(other):
	# Code to handle collision
	if is_instance_valid(other):
		break_apart()

func break_apart():
	# Change the collision shape to a smaller shape when breaking apart
	var new_shape = CircleShape2D.new()
	new_shape.radius = 10  # New radius for the smaller part
	
	# Set deferred to safely update the collision shape
	collision_shape.set_deferred("shape", new_shape)

	# Optionally, you might also want to change the position or add additional effects
	queue_free()  # Or handle the life cycle of the asteroid differently
```

### Explanation of Arguments
For `set_deferred()`, the typical usage is:
- **Property Name (String)**: The name of the property you want to change. In the example above, `"shape"` is the property being set. 
- **Value**: The new value you want to assign to that property. In this case, it's the `new_shape` variable, which contains a new instance of `CircleShape2D`.

### Summary
Using `set_deferred()` allows you to change properties of nodes in a safe manner. In the example with the space rock, it helps ensure that you can change the collision shape without immediately affecting the current processing of the scene, leading to a smoother gameplay experience. If you have further questions or need more examples, don’t hesitate to ask!
