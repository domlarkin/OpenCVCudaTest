build: cannyEdgeDetectorNPP

cannyEdgeDetectorNPP.o: src/cannyEdgeDetectorNPP.cpp
	/usr/local/cuda-8.0/bin/nvcc -ccbin g++ -I/usr/local/cuda-8.0/samples/common/inc -I/usr/local/cuda-8.0/samples/7_CUDALibraries/common/UtilNPP -I/usr/local/cuda-8.0/samples/7_CUDALibraries/common/FreeImage/include -m64 -gencode arch=compute_62,code=compute_62 -o cannyEdgeDetectorNPP.o -c src/cannyEdgeDetectorNPP.cpp

cannyEdgeDetectorNPP: cannyEdgeDetectorNPP.o
	/usr/local/cuda-8.0/bin/nvcc -ccbin g++   -m64      -gencode arch=compute_62,code=compute_62 -o cannyEdgeDetectorNPP cannyEdgeDetectorNPP.o  -L/usr/local/cuda-8.0/samples/7_CUDALibraries/common/FreeImage/lib/ -L/usr/local/cuda-8.0/samples/7_CUDALibraries/common/FreeImage/lib/linux -L/usr/local/cuda-8.0/samples/7_CUDALibraries/common/FreeImage/lib/linux/aarch64 -lnppi_static -lnppc_static -lculibos -lfreeimage

clean:
	rm -f cannyEdgeDetectorNPP cannyEdgeDetectorNPP.o

# nvidia@tegra-ubuntu:~/NVIDIA_CUDA-8.0_Samples/7_CUDALibraries/cannyEdgeDetectorNPP$ make V=1

# /usr/local/cuda-8.0/bin/nvcc -ccbin g++ -I../../common/inc -I../common/UtilNPP -I../common/FreeImage/include  -m64    -gencode arch=compute_62,code=compute_62 -o cannyEdgeDetectorNPP.o -c # cannyEdgeDetectorNPP.cpp

# /usr/local/cuda-8.0/bin/nvcc -ccbin g++   -m64      -gencode arch=compute_62,code=compute_62 -o cannyEdgeDetectorNPP cannyEdgeDetectorNPP.o  -L../common/FreeImage/lib/ -L../common/FreeImage/lib/linux -L../common/FreeImage/lib/linux/aarch64 -lnppi_static -lnppc_static -lculibos -lfreeimage

# ../common/FreeImage/lib/linux/aarch64/libfreeimage.a(strenc.o): In function `StrIOEncInit':
# strenc.c:(.text+0x1294): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
# mkdir -p ../../bin/aarch64/linux/release
# cp cannyEdgeDetectorNPP ../../bin/aarch64/linux/release

