extends Area2D

@onready var orange = $AnimatedSprite2D

func _ready() -> void:
	orange.play("orange")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	orange.play("collected")
	await orange.animation_finished
	orange.hide()
