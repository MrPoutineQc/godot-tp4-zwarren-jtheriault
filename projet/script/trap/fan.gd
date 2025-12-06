extends Area2D

@onready var fan_anim = $AnimatedSprite2D

func _ready() -> void:
	fan_anim.play("active")
