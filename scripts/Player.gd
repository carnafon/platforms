
extends CharacterBody2D

@export var speed: float = 240.0
@export var jump_force: float = 520.0
@export var gravity: float = 1400.0
@export var max_jumps: int = 2
@export var dash_speed: float = 720.0
@export var dash_time: float = 0.15
@export var wall_slide_gravity: float = 300.0

var jumps_left: int
var dashing: bool = false
var dash_timer: float = 0.0
var facing: int = 1

func _ready():
    jumps_left = max_jumps

func _physics_process(delta: float) -> void:
    var input_dir = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    if input_dir != 0:
        facing = sign(input_dir)

    if not dashing:
        velocity.x = lerp(velocity.x, input_dir * speed, 0.2)

    # Gravity
    if not is_on_floor():
        if is_on_wall() and input_dir != 0 and sign(velocity.x) == sign(input_dir) and velocity.y > 0.0:
            # Wall slide reduces gravity
            velocity.y = lerp(velocity.y, 120.0, 0.1)
        else:
            velocity.y += gravity * delta
    else:
        jumps_left = max_jumps
        # small friction on ground
        if abs(input_dir) < 0.1:
            velocity.x = lerp(velocity.x, 0.0, 0.2)

    # Jump
    if Input.is_action_just_pressed("jump"):
        if is_on_floor():
            _do_jump()
        elif is_on_wall():
            # wall jump opposite direction
            velocity.x = -facing * speed * 0.9
            _do_jump()
        elif jumps_left > 0:
            _do_jump()

    # Dash
    if Input.is_action_just_pressed("dash") and not dashing:
        dashing = true
        dash_timer = dash_time
        var dir = input_dir
        if dir == 0:
            dir = facing
        velocity.y = 0.0
        velocity.x = dir * dash_speed

    if dashing:
        dash_timer -= delta
        if dash_timer <= 0.0:
            dashing = false

    move_and_slide()

func _do_jump():
    velocity.y = -jump_force
    jumps_left -= 1
