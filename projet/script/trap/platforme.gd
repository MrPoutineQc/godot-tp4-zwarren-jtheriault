extends Area2D

@onready var platforme = $AnimatedSprite2D

func _ready() -> void:
	platforme.play("active")
