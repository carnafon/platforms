
extends Camera2D

@export var zoom_level: float = 1.0

func _ready():
    zoom = Vector2(zoom_level, zoom_level)
    position_smoothing_enabled = true
    position_smoothing_speed = 8.0
