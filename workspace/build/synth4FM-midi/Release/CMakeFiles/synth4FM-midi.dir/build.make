# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ben/Desktop/2019/allolib/cmake/single_file

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release

# Include any dependencies generated for this target.
include CMakeFiles/synth4FM-midi.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/synth4FM-midi.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/synth4FM-midi.dir/flags.make

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o: CMakeFiles/synth4FM-midi.dir/flags.make
CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o: /home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o -c /home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp > CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.i

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp -o CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.s

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.requires:

.PHONY : CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.requires

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.provides: CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.requires
	$(MAKE) -f CMakeFiles/synth4FM-midi.dir/build.make CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.provides.build
.PHONY : CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.provides

CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.provides.build: CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o


# Object files for target synth4FM-midi
synth4FM__midi_OBJECTS = \
"CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o"

# External object files for target synth4FM-midi
synth4FM__midi_EXTERNAL_OBJECTS =

/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: CMakeFiles/synth4FM-midi.dir/build.make
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/lib/libal.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libGL.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/libal_soundfile.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libsndfile.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/libal_soundfile.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libsndfile.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/lib/libal.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/Gamma/lib/libGamma.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/glfw/src/libglfw3.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/librt.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libm.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libX11.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libXrandr.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libXinerama.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libXcursor.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /home/ben/Desktop/2019/allolib/build/Release/glew/lib/libGLEW.a
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libGL.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libGLU.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: /usr/lib/x86_64-linux-gnu/libsndfile.so
/home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi: CMakeFiles/synth4FM-midi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/synth4FM-midi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/synth4FM-midi.dir/build: /home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi

.PHONY : CMakeFiles/synth4FM-midi.dir/build

CMakeFiles/synth4FM-midi.dir/requires: CMakeFiles/synth4FM-midi.dir/home/ben/Desktop/2019/allolib/276ia/workspace/synth4FM-midi.cpp.o.requires

.PHONY : CMakeFiles/synth4FM-midi.dir/requires

CMakeFiles/synth4FM-midi.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/synth4FM-midi.dir/cmake_clean.cmake
.PHONY : CMakeFiles/synth4FM-midi.dir/clean

CMakeFiles/synth4FM-midi.dir/depend:
	cd /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release/CMakeFiles/synth4FM-midi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/synth4FM-midi.dir/depend
