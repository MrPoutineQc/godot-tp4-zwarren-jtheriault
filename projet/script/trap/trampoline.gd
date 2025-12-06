extends Area2D

@onready var trampoline_anim = $AnimatedSprite2D
const BOUNCE_FORCE := -700.0

func _ready() -> void:
	trampoline_anim.play("off")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if "velocity" in body:
			body.velocity.y = BOUNCE_FORCE
		trampoline_anim.play("active")
		await trampoline_anim.animation_finished
		trampoline_anim.play("off")
