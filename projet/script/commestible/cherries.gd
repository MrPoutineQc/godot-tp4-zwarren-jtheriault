extends Area2D

@onready var cherries = $AnimatedSprite2D

func _ready() -> void:
	cherries.play("Cherries")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	cherries.play("collected")
	await cherries.animation_finished
	cherries.hide()
