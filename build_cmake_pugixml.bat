:: Build a CMake dependency
mkdir build\%SEAMASS_TOOLSET%\%SEAMASS_DEP%
pushd "src\%SEAMASS_DEP%*\scripts"
set "_DIR=%cd%"
popd
mkdir build\%SEAMASS_TOOLSET%\%SEAMASS_DEP%\%SEAMASS_BUILD%
pushd build\%SEAMASS_TOOLSET%\%SEAMASS_DEP%\%SEAMASS_BUILD%
cmake -G"NMake Makefiles" -C"%~dp0build.cmake" -DCMAKE_INSTALL_PREFIX="%~dp0install\%SEAMASS_TOOLSET%\%SEAMASS_DEP%\%SEAMASS_BUILD%" %_DIR%
if %errorlevel% neq 0 (
	popd
	exit /b %errorlevel%
)
nmake install
if %errorlevel% neq 0 (
	popd
	exit /b %errorlevel%
)
popd


