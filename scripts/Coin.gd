
extends Area2D

@export var spin_speed: float = 3.0
@onready var sprite: Sprite2D = $Sprite2D

func _process(delta):
    sprite.rotation += spin_speed * delta

func _on_body_entered(body):
    if body.is_in_group("player"):
        var main = get_tree().current_scene
        if main.has_method("add_coin"):
            main.add_coin()
        queue_free()
