extends CharacterBody2D #tells Godot how this object should act (which class it inherits)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0 #this is negative because it is acting against gravity

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#setting up for grabbable objects later
var canPick = true #pick is set to "K" you can change this in the input map
# drop is set to "J"

func _physics_process(delta): #a delta function means it is a loop that plays over every tick
	# physics processes have a faster tick than a standard process
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY #velcoity.y means speed upwards

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions using the input map in project settings
	var direction = Input.get_axis("left", "right")
	if direction != 0: # ! means NOT so this line means: if the direction is not equal to 0 aka if the sprite is moving
		$AnimatedSprite2D.flip_h = (direction == -1) # but is moving left (that's the-1) then flip the animation horizontally 
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("skip") #if you're moving along the x-axis (left or right) play the animation
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("default") # if player is not moving play the default animation and slow down to stop
		
	move_and_slide() #in built function to control player character collision behaviour

