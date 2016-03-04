######################################################################
# User configuration
######################################################################
# Path to nodemcu-uploader (https://github.com/kmpm/nodemcu-uploader)
NODEMCU-UPLOADER=python ../nodemcu-uploader/nodemcu-uploader.py --baud 9600
# Serial port
PORT=/dev/ttyUSB0

######################################################################
# End of user config
######################################################################
LUA_FILES := $(wildcard *lua)
STATIC_FILES:= $(wildcard static/*)
ROUTES_FILES:= $(wildcard routes/*)

# Upload all
all: upload_lua upload_static upload_routes

upload_lua: $(LUA_FILES)
	@$(NODEMCU-UPLOADER) -p $(PORT) upload $(foreach f, $^, $(f))



# Print usage
usage:
	@echo "make upload FILE:=<file>  to upload a specific file (i.e make upload FILE:=init.lua)"
	@echo "make to upload all"
	@echo $(TEST)

# Upload one files only
upload:
	@$(NODEMCU-UPLOADER) -p $(PORT) upload $(FILE)

# Upload one files only
upload_static: $(STATIC_FILES)
	@$(NODEMCU-UPLOADER) -p $(PORT) upload $(foreach f, $^, $(f))
#upload routes
upload_routes: $(ROUTES_FILES)
	@$(NODEMCU-UPLOADER) -p $(PORT) upload $(foreach f, $^, $(f))
