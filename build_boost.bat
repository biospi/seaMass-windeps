@echo off

pushd "%~dp0/boost_1_57_0"
call bootstrap.bat
b2 %*
popd
