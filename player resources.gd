extends Node
@export var exp = 0
@export var coins = 0
@onready var hud = $"../hud"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func add_exp():
	exp = exp+1
	hud.set_exp(exp)
	
	
func add_coins():
	coins = coins+1
	hud.set_coins(coins)
