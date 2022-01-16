# Makefile by Igor to Zac Rich
# Below are some variables.
EXECUTABLE_NAME = "VkT"
CPPARAMS = -std=gnu++14 -fdiagnostics-color=always -fdiagnostics-show-labels -Wall -Wextra
LDLINUXFLAGS = -I headers -lGL -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lm
objects = $(wildcard src/*.cpp)

# create directory bin/linux if not existent
# compile the program to the folder using g++ and use the EXECUTABLE_NAME variable as the name of the executable.
buildlinux:
	@echo "Compiling for Linux"
	mkdir -p bin/linux
	g++ $(objects) -g $(CPPARAMS) $(LDLINUXFLAGS) -o bin/linux/$(EXECUTABLE_NAME)
	@echo "Copying assets..."
	@cp -r gamedata bin/linux

# if more make build commands are made for other platforms, add them here, this will run them all.
all: buildlinux