extends Node2D

@export var arvore_cena: PackedScene
@export_range(1, 500, 1) var quantidade: int = 30
@export var tamanho_mapa: Vector2 = Vector2(1000, 800)

func _ready() -> void:
	if arvore_cena == null:
		push_error("Arraste Arvore.tscn para o campo Arvore Cena.")
		return
		
	for i in range(quantidade):
		var arvore = arvore_cena.instantiate()
		
		add_child(arvore)
		
		arvore.position = Vector2(
			randf_range(0.0, tamanho_mapa.x),
			randf_range(0.0, tamanho_mapa.y)
		)
