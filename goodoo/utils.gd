extends Node

func dict_to_json(dict):
	var json = JSON.new()
	return json.stringify(dict,"\t",false)

func extract_properties(control:Control) -> Dictionary:
	var dict = control.get_property_list()
	var props = {}
	if control is MarginContainer:
		props.const_margin_right = control.get_theme_constant("margin_right")
		props.const_margin_top = control.get_theme_constant("margin_top")
		props.const_margin_left = control.get_theme_constant("margin_left")
		props.const_margin_bottom = control.get_theme_constant("margin_bottom")
		
	for prop in dict:
#		if prop.name != "theme":
#			continue
#		if ["theme",
#			"size_flags_horizontal",
#			"size_flags_vertical",
#			"layout_mode",
#			"anchors_preset",
#			"anchor_left",
#			"anchor_top",
#			"anchor_right",
#			"offset_right",
#			"offset_left",
#			"offset_bottom",
#			"offset_top",
#			"anchor_bottom",
#			].count(prop.name) <1:
#			continue
		if [
			"Transform", 
			"transform",
			"_import_path",
#			"layout_mode",
#			"size_flags_horizontal",
#			"size_flags_vertical",
			"unique_name_in_owner",
			"scene_file_path",
			"owner",
			"position",
			"size",
			"scale",
			"global_position",
			"rotation",
			"text"].count(prop.name)>0: 
			continue
		if control.get(prop.name) != null:
			props[prop.name] = control.get(prop.name)
	props.erase("name")
#	print(dict_to_json(props))
	return props

func get_controls_from_path(path):
	var controls = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				var control = load("res://"+path+"/"+file_name)
				controls.append(control.instantiate())
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return controls
