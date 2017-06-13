cmake_minimum_required(VERSION 2.8)
project( OpenCVtests )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

message(STATUS "OpenCV library status:")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

add_executable( DisplayImage src/DisplayImage.cpp )
target_link_libraries( DisplayImage ${OpenCV_LIBS} )

add_executable( HoughLines src/HoughLines.cpp )
target_link_libraries( HoughLines ${OpenCV_LIBS} opencv_cudaimgproc )

# /usr/lib/libopencv_cudaimgproc.so

# nvidia@tegra-ubuntu:~/Projects/HoughLines$ ./gencode.sh 
# nvcc warning : The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated, and may be removed in a future release (Use -Wno-deprecated-gpu-targets to suppress warning).
# -gencode arch=compute_62,code=sm_62

# https://stackoverflow.com/questions/25748039/add-cuda-to-ros-package
nvidia@tegra-ubuntu:~/NVIDIA_CUDA-8.0_Samples/7_CUDALibraries/cannyEdgeDetectorNPP$ make V=1
nvcc warning : The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated, and may be removed in a future release (Use -Wno-deprecated-gpu-targets to suppress warning).
/usr/local/cuda-8.0/bin/nvcc -ccbin g++ -I../../common/inc -I../common/UtilNPP -I../common/FreeImage/include  -m64    -gencode arch=compute_20,code=compute_20 -o cannyEdgeDetectorNPP.o -c cannyEdgeDetectorNPP.cpp
nvcc warning : The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated, and may be removed in a future release (Use -Wno-deprecated-gpu-targets to suppress warning).
/usr/local/cuda-8.0/bin/nvcc -ccbin g++   -m64      -gencode arch=compute_20,code=compute_20 -o cannyEdgeDetectorNPP cannyEdgeDetectorNPP.o  -L../common/FreeImage/lib/ -L../common/FreeImage/lib/linux -L../common/FreeImage/lib/linux/aarch64 -lnppi_static -lnppc_static -lculibos -lfreeimage
nvcc warning : The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated, and may be removed in a future release (Use -Wno-deprecated-gpu-targets to suppress warning).
../common/FreeImage/lib/linux/aarch64/libfreeimage.a(strenc.o): In function `StrIOEncInit':
strenc.c:(.text+0x1294): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
mkdir -p ../../bin/aarch64/linux/release
cp cannyEdgeDetectorNPP ../../bin/aarch64/linux/release

