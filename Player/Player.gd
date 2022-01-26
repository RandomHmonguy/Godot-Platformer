extends KinematicBody2D

var velocity = Vector2(0,0)
var gravity = 30
var speed = 500
var jump_force = -900

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		
	
	### Colision and Gravity
	if velocity.y != 0 and is_on_floor():
		velocity.y = 0
		
	if not is_on_floor():
		velocity.y += gravity
		
	if is_on_ceiling():
		velocity.y = gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	### Stops Player Movement
	velocity.x = lerp(velocity.x,0,0.2)
	
	
	### Movement
	move_and_slide(velocity,Vector2.UP)
