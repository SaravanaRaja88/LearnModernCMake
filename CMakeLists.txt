cmake_minimum_required(VERSION 3.14)
project(HelloWorldApp)

set(CMAKE_CXX_STANDARD 17)
set(TARGET ${PROJECT_NAME})

#GNU standard installation directories
include(GNUInstallDirs)

#The creates a shared library to execute the HelloWorldApp
add_subdirectory(HelloWorldLibrary)

add_executable(${TARGET} main.cpp)
target_link_libraries(${TARGET} PRIVATE HelloWorld)