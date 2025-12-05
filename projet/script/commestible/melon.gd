extends Area2D

@onready var melon = $AnimatedSprite2D

func _ready() -> void:
	melon.play("Melon")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	melon.play("collected")
	await melon.animation_finished
	melon.hide()

	
