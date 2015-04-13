@echo off

:: If Intel compiler
if defined BIN_ROOT (
	if ""=="%1" (
              	echo ERROR - For Intel compiler builds you must specify the boost toolset manually as an argument e.g. 'build intel-15.0'
		exit /b 1
	)
	set "_TOOLSET=toolset=%1"
	set "_COMPILER=intel"
	set "_BOOTSTRAP_COMPILER=intel-win32"
) else (
	set "_COMPILER=msvc"
)

:: Detect architecture
if defined Platform (
	set "_ADDRESS_MODEL=address-model=64"
	set "_PLATFORM=64"
) else (
	set "_ADDRESS_MODEL=address-model=32"
	set "_PLATFORM=32"
)

:: Prepare for builds
set "SEAMASS_TOOLSET=%_COMPILER%%_PLATFORM%"
setlocal
pushd "%~dp0"

:: Build Boost
pushd "src\boost*"
if not exist b2.exe call bootstrap.bat %_BOOTSTRAP_COMPILER%
if %errorlevel% neq 0 goto eof 
b2 stage --with-system --with-filesystem --with-program_options --with-timer --stagedir=..\..\install\%SEAMASS_TOOLSET%\boost --build-dir=..\..\build\%SEAMASS_TOOLSET% %_ADDRESS_MODEL% %_TOOLSET%
if %errorlevel% neq 0 goto eof 
popd

:: Build curl
pushd "src\curl*"
xcopy * ..\..\build\%SEAMASS_TOOLSET%\curl\ /s /e /q /y
pushd ..\..\build\%SEAMASS_TOOLSET%\curl\winbuild
nmake /f Makefile.vc mode=static MACHINE=%_ARCH%
nmake /f Makefile.vc mode=static DEBUG=yes MACHINE=%_ARCH%
xcopy ..\builds\libcurl-vc-%_ARCH%-release-static-ipv6-sspi-winssl ..\..\..\..\install\%SEAMASS_TOOLSET%\curl\release\ /s /e /q /y
xcopy ..\builds\libcurl-vc-%_ARCH%-debug-static-ipv6-sspi-winssl ..\..\..\..\install\%SEAMASS_TOOLSET%\curl\debug\ /s /e /q /y
pushd ..\..\..\..\install\%SEAMASS_TOOLSET%\curl\release\lib
copy libcurl_a.lib curl.lib /y
del libcurl_a.lib
popd
pushd ..\..\..\..\install\%SEAMASS_TOOLSET%\curl\debug\lib
copy libcurl_a_debug.lib curl.lib /y
del libcurl_a_debug.lib
popd
popd
popd

:: Prepare for CMake builds
if defined BIN_ROOT (
	:: Don't set these before or it messes up Boost build!
	set "CC=%BIN_ROOT%%TARGET_ARCH%\icl.exe"
	set "CXX=%BIN_ROOT%%TARGET_ARCH%\icl.exe"
)

:: Build zlib
set "SEAMASS_DEP=zlib"
set "SEAMASS_BUILD=debug"
call build_cmake.bat
if %errorlevel% neq 0 goto eof
set "SEAMASS_BUILD=release"
call build_cmake.bat
if %errorlevel% neq 0 goto eof

:: Build lpng
set "SEAMASS_DEP=lpng"
set "SEAMASS_BUILD=debug"
call build_cmake.bat
if %errorlevel% neq 0 goto eof
set "SEAMASS_BUILD=release"
call build_cmake.bat
if %errorlevel% neq 0 goto eof

:: Build hdf5
set "SEAMASS_DEP=hdf5"
set "SEAMASS_BUILD=debug"
call build_cmake.bat
if %errorlevel% neq 0 goto eof
set "SEAMASS_BUILD=release"
call build_cmake.bat
if %errorlevel% neq 0 goto eof

:: Build netcdf-c
set "SEAMASS_DEP=netcdf-c"
set "SEAMASS_BUILD=debug"
call build_cmake.bat
if %errorlevel% neq 0 goto eof
set "SEAMASS_BUILD=release"
call build_cmake.bat
if %errorlevel% neq 0 goto eof

:: Build spatialindex
set "SEAMASS_DEP=spatialindex"
set "SEAMASS_BUILD=debug"
call build_cmake.bat
if %errorlevel% neq 0 goto eof
set "SEAMASS_BUILD=release"
call build_cmake.bat
if %errorlevel% neq 0 goto eof

:eof
popd
