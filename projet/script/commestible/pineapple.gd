extends Area2D

@onready var pineapple = $AnimatedSprite2D

func _ready() -> void:
	pineapple.play("pineapple")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	pineapple.play("collected")
	await pineapple.animation_finished
	pineapple.hide()
