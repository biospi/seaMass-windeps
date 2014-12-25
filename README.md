seamass-deps
============

Collection of 3rd party libraries required for compiling [seamass](https://github.com/biospi/seamass)
and [seamass-viz](https://github.com/biospi/seamass-viz). Libraries are built static, but with shared
runtime. Recommended for Windows builds and recent Mac builds (as seaMass and dependencies need to be
build with gcc or Intel compiler, whereas macports/brew can only employt clang on OSX 10.9+). You can
use for Linux builds too but probably better simply to install the dependencies using the usual
package manager. 

Building: Windows
------------------
Ensure you invoke the Visual Studio or Intel compiler command prompt with the desired build
environment (i.e. 32 or 64 bit). For Visual Studio builds, then simply run *build.bat*. For Intel
builds, you need to also supply the Boost toolset as an argument, e.g. *build.bat intel-15.0* 
for Intel C++ Composer XE 2015 or *build.bat intel-14.0* for Composer XE 2013..

Building: OSX
-------------
_todo_

Using
-----
These dependencies will be picked up automatically if you set two environment variables:
SEAMASS_TOOLSET should be set to the preferred build configuration to use (see subdirectories of 
'install' created during the build process, *e.g.* msvc32, intel64 etc). SEAMASS_BUILD should
be set to either *debug* or *release*. Then run CMake for seamass or seamass-viz while supplying the
seamass-deps cache file as a command line argument i.e.  *-C"\path\to\seamass-deps\build.cmake"*. 

seamass and seamass-viz include example batch/script files that set the above up for you if the
seamass-deps directory has been placed side by side with seamass or seamass-viz.
