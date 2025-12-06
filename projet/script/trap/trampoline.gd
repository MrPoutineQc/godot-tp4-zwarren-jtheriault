extends Area2D

@onready var trampoline_anim = $AnimatedSprite2D

func _ready() -> void:
	trampoline_anim.play("off")

func _on_body_entered(body: Node2D) -> void:
	trampoline_anim.play("active")
	await trampoline_anim.animation_finished
	trampoline_anim.play("off")
