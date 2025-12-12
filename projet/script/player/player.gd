extends CharacterBody2D

var base_speed := 200.0      # ta vitesse normale
var speed := base_speed       # ta vitesse actuelle
const JUMP_VELOCITY = -275.0
var can_double_jump = true
var is_hurt = false

var fan_push := 0.0           # force du ventilateur (modifiée par l'Area2D)

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# --- GRAVITÉ ---
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# --- RESET DOUBLE JUMP ---
	if is_on_floor():
		can_double_jump = true

	# --- SAUT ---
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("jump"):
		_play_anim("jump")
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and can_double_jump:
		velocity.y = JUMP_VELOCITY
		can_double_jump = false
		_play_anim("double_jump")

	# --- DIRECTION ---
	var direction := Input.get_axis("left", "right")

	if direction != 0:
		# Si le joueur bouge → on ignore le vent
		velocity.x = direction * speed
		
		if is_on_floor():
			_play_anim("run")

		# flip
		animated_sprite.flip_h = direction < 0

	else:
		# Si le joueur NE bouge pas et qu'il y a du vent → recul
		if fan_push != 0:
			velocity.x = fan_push
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		if is_on_floor():
			_play_anim("idle")

	# --- AIR ---
	if not is_on_floor() and velocity.y > 0:
		_play_anim("fall")

	if is_on_wall():
		_play_anim("wall_jump")
		if Input.is_action_just_pressed("jump") and is_on_wall():
			velocity.y = JUMP_VELOCITY

	move_and_slide()

# --- Change animation seulement si elle est différente ---
func _play_anim(name: String) -> void:
	if is_hurt:
		return
	if animated_sprite.animation != name:
		animated_sprite.play(name)
