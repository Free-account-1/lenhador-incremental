extends CanvasLayer

@onready var label: Label = $LabelMadeira
@onready var jogador = get_node("../Jogador")


func _ready() -> void:
	jogador.madeira_alterada.connect(atualizar_contador)
	atualizar_contador(jogador.madeira)


func atualizar_contador(quantidade: int) -> void:
	label.text = "Madeira: %d" % quantidade
