cmake_minimum_required(VERSION 2.8)
project( OpenCVtests )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

message(STATUS "OpenCV library status:")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

add_executable( DisplayImage DisplayImage.cpp )
target_link_libraries( DisplayImage ${OpenCV_LIBS} )

add_executable( HoughLines HoughLines.cpp )
target_link_libraries( HoughLines ${OpenCV_LIBS} opencv_cudaimgproc )

# /usr/lib/libopencv_cudaimgproc.so
