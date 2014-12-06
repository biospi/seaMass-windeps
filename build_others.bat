@echo off

pushd "%~dp0/eigen-3.2.2"
mkdir build
cd build
cmake -G"NMake Makefiles" -C"..\..\build.cmake" %* .. 2> nul
nmake install
popd

pushd "%~dp0/zlib-1.2.8"
mkdir build
cd build
cmake -G"NMake Makefiles" -C"..\..\build.cmake" %* ..
nmake install
popd

@pushd "%~dp0/lpng1615"
mkdir build
cd build
cmake -G"NMake Makefiles" -C"..\..\build.cmake" %* ..
nmake install
popd

pushd "%~dp0/hdf5-1.8.14"
mkdir build
cd build
cmake -G"NMake Makefiles" -C"..\..\build.cmake" %* ..
nmake install
popd

@pushd "%~dp0/spatialindex-src-1.8.5"
mkdir build
cd build
cmake -G"NMake Makefiles" -C"..\..\build.cmake" %* ..
nmake install
popd



