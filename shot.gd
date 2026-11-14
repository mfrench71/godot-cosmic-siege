extends Sprite2D

const SPEED = 4 # pixels per tick, the same as the arcade's shot: 240 pixels per second
const TOP = 36 # the arcade's shot goes no higher than this

# Godot runs this once every tick: a steady 60 times a second
func _physics_process(_delta):
	position.y -= SPEED
	if position.y < TOP:
		queue_free()
