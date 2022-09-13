extends KinematicBody2D

var velocity = Vector2.ZERO 
var rotationSpeed = 5
var acceleration = 0.1
var maxSpeed = 10

func _ready():
	pass

func _physics_process(delta):
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, maxSpeed)
	if Input.is_action_pressed("Forward"):
		velocity = velocity + Vector2(0, -acceleration).rotated(rotation) 
#	if Input.is_action_pressed("Down"):
#		velocity = velocity + Vector2(0, +acceleration).rotated(rotation)
	if Input.is_action_pressed("Left"):
		rotation_degrees = rotation_degrees - rotationSpeed
	if Input.is_action_pressed("Right"):
		rotation_degrees = rotation_degrees + rotationSpeed
		

	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
