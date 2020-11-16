cmake_minimum_required ( VERSION 3.5)
set( CMAKE_CXX_FLAGS "-std=c++11" )
set( CMAKE_BUILD_TYPE "Release" )
set( GLOG_LIBRARY "/usr/lib/x86_64-linux-gnu/libglog.so" )

include_directories( "/usr/include/glog" )

find_package( OpenCV REQUIRED )
find_package( Ceres REQUIRED )

find_package( glog 0.3.5 REQUIRED )

include_directories( ${CERES_INCLUDE_DIRS} )
include_directories( ${OpenCV_INCLUDE_DIRS} )

project( CH6 )

# gaussNewton
add_executable ( gaussNewton gaussNewton.cpp )
target_link_libraries( gaussNewton ${OpenCV_LIBS} )

# ceres_solver
add_executable ( ceresCurveFitting ceresCurveFitting.cpp )
target_link_libraries( ceresCurveFitting glog::glog ${CERES_LIBRARIES} ${OpenCV_LIBRARIES} )