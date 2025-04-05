extends CharacterBody2D

@export var target_to_chase: CharacterBody2D
@export var speed = 50.0
@export var follow_radius = 2000.0
@export var attack_radius = 300.0

@onready var agent: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = target_to_chase


#func _ready():
	#agent.target_desired_distance = 200.0

func _physics_process(_delta: float) -> void:
	if not player:
		return

	var distance = position.distance_to(player.global_position)



	if distance < attack_radius: 
		set_velocity(Vector2(0.0, 0.0))
		 #= Vector2.ZERO
		print(velocity)
	elif distance < follow_radius:
		#agent.target_position = player.global_position
		print("Player detected! Planning path.")
		var direction = (player.global_position - global_position).normalized()
		print(direction)
		#velocity = direction * speed
		set_velocity(direction * speed)
		move_and_slide()
	else:
		set_velocity(Vector2(0.0, 0.0))
		#velocity = Vector2.ZERO
		
		#agent.target_position = global_position

	#if agent.is_navigation_finished():
		#velocity = Vector2.ZERO
	#else:
		#var next_path_position = agent.get_next_path_position()
		#var direction = (next_path_position - global_position).normalized()
		#velocity = direction * speed






#extends CharacterBody2D
#
#@export var speed := 100.0
#@export var follow_radius := 200.0
#
#var player : CharacterBody2D
#var agent : NavigationAgent2D
#
#func _ready():
	#player = get_node(".././Camera/player")
	#if not player:
		#print("Player node not found!")
	#agent = $NavigationAgent2D
	#agent.target_desired_distance = 4.0
#
#func _physics_process(delta):
	#if not player:
		#return
#
	#var distance = global_position.distance_to(player.global_position)
#
	#if distance < follow_radius:
		#agent.set_target_location(player.global_position)
		#print("Player detected! Planning path.")
	#else:
		#agent.set_target_location(global_position)
		#print("Too far. Not following.")
#
	#if agent.is_navigation_finished():
		#velocity = Vector2.ZERO
	#else:
		#var next_path_position = agent.get_next_path_position()
		#var direction = (next_path_position - global_position).normalized()
		#velocity = direction * speed
#
	#move_and_slide()
