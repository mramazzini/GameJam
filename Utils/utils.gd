class_name Utils
# Helper functions
enum weapons{NONE,HOSE,EXTINGUISHER,AXE}
static func between(val,start,end):
	return val >= start && val < end
	
static func mouseVisible():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
static func mouseCapture():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
static func toggleMouse():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouseVisible()
	else:
		mouseCapture()
