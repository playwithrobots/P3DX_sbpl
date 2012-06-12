cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

rosbuild_init()
add_definitions(-DROS)

rosbuild_add_library(P3DX_sbpl 
                         src/discrete_space_information/nav2d/environment_nav2D.cpp
                         src/discrete_space_information/navxythetalat/environment_navxythetalat.cpp
                         src/discrete_space_information/navxythetalat/environment_navxythetamlevlat.cpp
                         src/discrete_space_information/nav2d_uu/environment_nav2Duu.cpp
                         src/discrete_space_information/template/environment_XXX.cpp
                         src/discrete_space_information/robarm/environment_robarm.cpp
                         src/planners/ARAStar/araplanner.cpp
                         src/planners/ADStar/adplanner.cpp
                         src/planners/PPCP/ppcpplanner.cpp
			 src/planners/RStar/rstarplanner.cpp
                         src/utils/heap.cpp
                         src/utils/mdp.cpp
                         src/utils/utils.cpp
			 src/utils/2Dgridsearch.cpp	
			 )


#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#uncomment if you have defined messages
rosbuild_genmsg()
#uncomment if you have defined services
#rosbuild_gensrv()

#common commands for building c++ executables and libraries

#target_link_libraries(${PROJECT_NAME} another_library)
#rosbuild_add_boost_directories()
#rosbuild_link_boost(${PROJECT_NAME} thread)
rosbuild_add_executable(ADstar src/test/ADstar.cpp)
rosbuild_add_executable(P3DX_motion src/test/P3DX_motion.cpp)
target_link_libraries(ADstar P3DX_sbpl)
#target_link_libraries(example ${PROJECT_NAME})
