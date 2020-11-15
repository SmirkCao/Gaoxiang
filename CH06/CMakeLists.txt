cmake_minimum_required ( VERSION 2.8)
set( CMAKE_CXX_FLAGS "-std=c++11" )

find_package( OpenCV REQUIRED )

include_directories( "/usr/include/eigen3" )
include_directories( ${OpenCV_INCLUDE_DIRS} )

project( CH6 )

add_executable ( gaussNewton gaussNewton.cpp )
target_link_libraries( gaussNewton ${OpenCV_LIBS} )
