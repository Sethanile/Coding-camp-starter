extends CanvasLayer

@onready var exp = $Panel/exp
@onready var coin = $Panel/coin
@onready var progress_bar = $Panel/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	set_coins(0)
	set_exp(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_coins(value):
	coin.text = str(value) +  " coins"

func set_exp(value):
	exp.text = str(value) + " exp"

func set_hp(value):
	progress_bar.value = value
