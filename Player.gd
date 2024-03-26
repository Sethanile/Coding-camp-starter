extends CharacterBody2D #tells Godot how this object should act (which class it inherits)

@export var SPEED = 300.0
const dash_speed = 3000.0

const JUMP_VELOCITY = -700.0 #this is negative because it is acting against gravity
const plummet_velocity = 900.0

var can_doublejump = false
var is_crouching = false

const DOUBLETAP_DELAY = .25
var doubletap_time = DOUBLETAP_DELAY
var last_keycode = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#setting up for grabbable objects later
var canPick = true #pick is set to "K" you can change this in the input map
# drop is set to "J"

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("left", "right")
	
	#dash
	if Input.is_action_just_pressed("leftdash"):
		velocity.x = direction * dash_speed
	if Input.is_action_just_pressed("rightdash"):
		velocity.x = direction * dash_speed
		
	if direction != 0:
		$AnimatedSprite2D.flip_h = (direction == -1)
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("skip")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("default")

	#jump and double jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		can_doublejump = true
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and !is_on_floor() and can_doublejump:
		can_doublejump = false 
		velocity.y = JUMP_VELOCITY
		
	#crouch
	if Input.is_action_pressed("crouch") and is_on_floor():
		SPEED = 100.0
		floor_stop_on_slope = false
		velocity.y = plummet_velocity
	elif Input.is_action_pressed("crouch") and !is_on_floor():
		velocity.y = plummet_velocity
	else:
		SPEED = 300.0
		floor_stop_on_slope = true
		
	move_and_slide()


