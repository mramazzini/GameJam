class_name FS

static func loadScenes(path) -> Dictionary:
	var data = {}
	var folder = DirAccess.open(path)
	if folder:
		folder.list_dir_begin()
		var file_name = folder.get_next()
		while file_name != "":
			if !folder.current_is_dir():
				var sceneName = file_name.split(".")[0]
				var fileType = file_name.split(".")[1]
				if fileType == "tscn":
					data[sceneName] = load(path + file_name)
			file_name = folder.get_next()
	return data
