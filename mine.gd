extends StaticBody2D
@onready var animation_player = $AnimationPlayer

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_detection_body_entered(body):
	if body.is_in_group("player"):
		animation_player.play("boom")
		await animation_player.animation_finished
		queue_free()

func _on_area_2d_2_body_entered(body):
	hit.emit()

