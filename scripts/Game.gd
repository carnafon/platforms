
extends Node2D

@onready var coin_label: Label = $UI/CoinLabel
var coins := 0

func add_coin():
    coins += 1
    coin_label.text = str(coins)
