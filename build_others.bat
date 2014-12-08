@echo off

pushd "%~dp0/zlib-1.2.8"
mkdir build_release
pushd build_release
cmake -G"NMake Makefiles" -C"..\..\release.cmake" %* .. 2> nul
nmake install
popd
mkdir build_debug
pushd build_debug
cmake -G"NMake Makefiles" -C"..\..\debug.cmake" %* .. 2> nul
nmake install
popd
rmdir /s /q build_release
rmdir /s /q build_debug
popd

pushd "%~dp0/lpng1615"
mkdir build_release
pushd build_release
cmake -G"NMake Makefiles" -C"..\..\release.cmake" %* ..
nmake install
popd
mkdir build_debug
pushd build_debug
cmake -G"NMake Makefiles" -C"..\..\debug.cmake" %* ..
nmake install
popd
rmdir /s /q build_release
rmdir /s /q build_debug
popd

pushd "%~dp0/hdf5-1.8.14"
mkdir build_release
pushd build_release
cmake -G"NMake Makefiles" -C"..\..\release.cmake" %* ..
nmake install
popd
mkdir build_debug
pushd build_debug
cmake -G"NMake Makefiles" -C"..\..\debug.cmake" %* ..
nmake install
popd
rmdir /s /q build_release
rmdir /s /q build_debug
popd

pushd "%~dp0/spatialindex-src-1.8.5"
mkdir build_release
pushd build_release
cmake -G"NMake Makefiles" -C"..\..\release.cmake" %* ..
nmake install
popd
mkdir build_debug
pushd build_debug
cmake -G"NMake Makefiles" -C"..\..\debug.cmake" %* ..
nmake install
popd
rmdir /s /q build_release
rmdir /s /q build_debug
popd

