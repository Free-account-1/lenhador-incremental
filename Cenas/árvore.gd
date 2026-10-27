extends Area2D

@export var golpes_para_cair: int = 3
@export var madeira_por_arvore: int = 5
@export var tempo_renascimento: float = 10.0

var golpes_recebidos: int = 0
var derrubada: bool = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var colisao: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	add_to_group("arvores")


func receber_golpe(jogador: Node) -> void:
	if derrubada:
		return
		
		golpes_recebidos += 1
		print("Golpes na árvore: ", golpes_recebidos)
		
	if golpes_recebidos >= golpes_para_cair:
		derrubar(jogador)


func derrubar(jogador: Node) -> void:
	derrubada = true
	
	if jogador.has_method("adicionar_madeira"):
		jogador.adicionar_madeira(madeira_por_arvore)
	sprite.visible = false
	colisao.set_deferred("disabled", true)
	print("Árvore derrubada! Madeira coletada.")
	
	await get_tree().create_timer(tempo_renascimento).timeout
	
	golpes_recebidos = 0
	derrubada = false
	
	sprite.visible = true
	colisao.set_deferred("disabled", false)
	
	print("A árvore renasceu!")
