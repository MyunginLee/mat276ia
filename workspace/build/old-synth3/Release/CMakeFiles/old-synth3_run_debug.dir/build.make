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
CMAKE_BINARY_DIR = /home/ben/Desktop/2019/allolib/276ia/workspace/build/old-synth3/Release

# Utility rule file for old-synth3_run_debug.

# Include the progress variables for this target.
include CMakeFiles/old-synth3_run_debug.dir/progress.make

CMakeFiles/old-synth3_run_debug: /home/ben/Desktop/2019/allolib/276ia/workspace/bin/old-synth3
	cd /home/ben/Desktop/2019/allolib/276ia/workspace/bin && gdb -ex run ./old-synth3d

old-synth3_run_debug: CMakeFiles/old-synth3_run_debug
old-synth3_run_debug: CMakeFiles/old-synth3_run_debug.dir/build.make

.PHONY : old-synth3_run_debug

# Rule to build all files generated by this target.
CMakeFiles/old-synth3_run_debug.dir/build: old-synth3_run_debug

.PHONY : CMakeFiles/old-synth3_run_debug.dir/build

CMakeFiles/old-synth3_run_debug.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/old-synth3_run_debug.dir/cmake_clean.cmake
.PHONY : CMakeFiles/old-synth3_run_debug.dir/clean

CMakeFiles/old-synth3_run_debug.dir/depend:
	cd /home/ben/Desktop/2019/allolib/276ia/workspace/build/old-synth3/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/cmake/single_file /home/ben/Desktop/2019/allolib/276ia/workspace/build/old-synth3/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/old-synth3/Release /home/ben/Desktop/2019/allolib/276ia/workspace/build/old-synth3/Release/CMakeFiles/old-synth3_run_debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/old-synth3_run_debug.dir/depend

