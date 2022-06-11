extends Node

@onready
var menu_icon = preload("res://menu_icon.png")
var close_menu_icon = preload("res://close_menu_icon.png")

func initialize_presets():
	var button = Button.new()
	button.name = "icon-menu"
	button.icon = menu_icon
	button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	Goo.create_presets_from_control(button)
	button.name = "icon-close-menu"
	button.icon = close_menu_icon
	Goo.create_presets_from_control(button)
