extends RigidBody2D

var picked = false #set a variable for if our player has picked up the pumpkin and set to not

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if picked == true:
		self.position = %Player/Marker2D.global_position # to use % to get a node make the node a unique name by right clicking on it

func _input(event):
	if Input.is_action_just_pressed("pick"):
		var bodies = $Area2D.get_overlapping_bodies() 
		#bodies is now looking for anything inside the collision shape in Area2D
		for body in bodies:
			if body.name == "Player" and %Player.canPick == true:
				picked = true
				%Player.canPick = false
	
	if Input.is_action_just_pressed("drop") and picked == true:
		apply_impulse(Vector2(), Vector2(9000, 600))
		picked = false
		%Player.canPick = true
		
