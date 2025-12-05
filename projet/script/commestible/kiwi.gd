extends Area2D

@onready var kiwi = $AnimatedSprite2D

func _ready() -> void:
	kiwi.play("Kiwi")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	kiwi.play("collected")
	await kiwi.animation_finished
	kiwi.hide()
