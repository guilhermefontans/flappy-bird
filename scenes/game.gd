extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timeToReplay = get_node("TimeToReplay")
onready var pontosLabel = get_node("Pontos/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass
	
func kill():
	felpudo.apply_impulse(Vector2(0,0), Vector2(-100, 0))
	get_node("BackGround").stop()
	estado = PERDENDO
	get_node("SomHit").play()
	timeToReplay.start()
	
func pontuar():
	pontos += 1
	pontosLabel.set_text(str(pontos))
	get_node("SomScore").play()

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
