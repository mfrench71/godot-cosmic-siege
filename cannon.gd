extends Sprite2D

const SPEED = 1 # pixels per tick; there are 60 ticks per second, as in the arcade
const LEFT_EDGE = 24 # the middle of the cannon at the arcade's left limit
const RIGHT_EDGE = 193 # and at its right limit

# Godot runs this once every tick: a steady 60 times a second
func _physics_process(_delta):
	if Input.is_action_pressed("move_left"):
		position.x -= SPEED
	if Input.is_action_pressed("move_right"):
		position.x += SPEED
	position.x = clamp(position.x, LEFT_EDGE, RIGHT_EDGE)
