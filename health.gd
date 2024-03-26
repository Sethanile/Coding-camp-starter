extends Node




var health = 100
var alive = true
signal died





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if alive:
		if health <1:
			alive = false 
			died.emit()


func _on_died():
	pass # Replace with function body.
