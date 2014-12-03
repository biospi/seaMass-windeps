seamass-windeps
===============

Collection of 3rd party libraries for compiling [seamass](https://github.com/biospi/seamass)
and [seamass-viz](https://github.com/biospi/seamass-viz) on Windows (Visual Studio). Will be
picked up automatically by seamass builds if repository placed side by side with the
[seamass](https://github.com/biospi/seamass) repository and built. Libraries are built static,
but with shared runtime.

building
--------
Ensure you invoke the Visual Studio or Intel compiler command prompt with the desired build
environment (i.e. 32 or 64 bit). For 32bit Visual Studio builds, simply run *build_boost.bat*
and *build_others.bat* .

For Intel and/or 64 bit builds, you need to supply additional arguments to *build_boost.bat* .
For 64bit builds the argument is *address-model=64* . For Intel builds the argument is
*toolset=intel-14.0* (or your version number if not 14.0).

