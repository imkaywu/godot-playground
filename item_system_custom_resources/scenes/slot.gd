extends PanelContainer

@onready var texture_rect: TextureRect = $TextureRect

var item : Item = null:
	set(value):
		item = value
		
		if item:
			texture_rect.texture = item.texture
		else:
			texture_rect.texture = null
