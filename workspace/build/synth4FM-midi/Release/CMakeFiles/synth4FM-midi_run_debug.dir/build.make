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

# Utility rule file for synth4FM-midi_run_debug.

# Include the progress variables for this target.
include CMakeFiles/synth4FM-midi_run_debug.dir/progress.make

CMakeFiles/synth4FM-midi_run_debug: /home/ben/Desktop/2019/allolib/276ia/workspace/bin/synth4FM-midi
	cd /home/ben/Desktop/2019/allolib/276ia/workspace/bin && gdb -ex run ./synth4FM-midid

synth4FM-midi_run_debug: CMakeFiles/synth4FM-midi_run_debug
synth4FM-midi_run_debug: CMakeFiles/synth4FM-midi_run_debug.dir/build.make

.PHONY : synth4FM-midi_run_debug

# Rule to build all files generated by this target.
CMakeFiles/synth4FM-midi_run_debug.dir/build: synth4FM-midi_run_debug

.PHONY : CMakeFiles/synth4FM-midi_run_debug.dir/build

CMakeFiles/synth4FM-midi_run_debug.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/synth4FM-midi_run_debug.dir/cmake_clean.cmake
.PHONY : CMakeFiles/synth4FM-midi_run_debug.dir/clean

CMakeFiles/synth4FM-midi_run_debug.dir/depend:
	cd /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/synth4FM-midi/Release/CMakeFiles/synth4FM-midi_run_debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/synth4FM-midi_run_debug.dir/depend

