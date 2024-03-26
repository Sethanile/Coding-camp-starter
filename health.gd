extends Node

@onready var hud = $"../../CanvasLayer/hud"

var health = 5
var alive = true
signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	hud.set_hp(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if alive:
		if health <1:
			alive = false 
			died.emit()


func _on_died():
	pass # Replace with function body.

func take_damage():
	health -= 1
	print(health)
	hud.set_hp(health)

func reset_health():
	health = 5
	alive = true
