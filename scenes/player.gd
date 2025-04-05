extends CharacterBody2D

@onready var color_rect = $ColorRect as ColorRect
@onready var animation_player = $AnimationPlayer as AnimationPlayer

@export var move_speed : float = 150.0
@export var attack_speed : float = 400.0
@export var movement_direction : Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:	
	handle_movement()
	
	if is_on_wall():
		movement_direction.x = 0

func handle_movement() -> void:
	var movement_x : float = Input.get_axis("move_left", "move_right")
	var movement_y : float = Input.get_axis("move_up", "move_down")
	
	movement_direction = Vector2(movement_x, movement_y).normalized()
	
	velocity = movement_direction * move_speed
	
	move_and_slide()
	
	#print("X: ", movement_x, " Y: ", movement_y)
	#print("Velocity: ", velocity, " Collisions: ", get_slide_collision_count())
	



#animatii
