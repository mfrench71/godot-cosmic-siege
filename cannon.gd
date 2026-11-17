extends Sprite2D

const SPEED = 1 # pixels per tick; there are 60 ticks per second, as in the arcade
const LEFT_EDGE = 24 # the middle of the cannon at the arcade's left limit
const RIGHT_EDGE = 193 # and at its right limit
const SHOT_Y = 212 # a new shot starts here, on top of the cannon's barrel
const SHOT_SCENE = preload("res://shot.tscn") # the shot scene, loaded once, ready to make copies of

var shot = null # the shot this cannon fired, so it can tell whether it's still on the screen

# Godot runs this once every tick: a steady 60 times a second
func _physics_process(_delta):
	if Input.is_action_pressed("move_left"):
		position.x -= SPEED
	if Input.is_action_pressed("move_right"):
		position.x += SPEED
	position.x = clamp(position.x, LEFT_EDGE, RIGHT_EDGE)
	
	# Fire only when the key has just gone down and the last shot has gone
	if Input.is_action_just_pressed("fire") and not is_instance_valid(shot):
		shot = SHOT_SCENE.instantiate()
		shot.position = Vector2(position.x, SHOT_Y)
		get_parent().add_child(shot)
