set (HELLO_WORLD_VERSION 1.0.0)
# Project name and version
project(HelloWorld VERSION ${HELLO_WORLD_VERSION} LANGUAGES CXX)

# Project targets
set(TARGET ${PROJECT_NAME})

file(GLOB_RECURSE SOURCE_FILES  "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
file(GLOB_RECURSE PUBLIC_HEADERS   "${CMAKE_CURRENT_SOURCE_DIR}/*.h")

# Declare library
add_library(${TARGET} SHARED ${SOURCE_FILES} ${PUBLIC_HEADERS})

target_include_directories(${TARGET} PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include/${TARGET}>
        PRIVATE source)

#Install the library to standard path.
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${TARGET})

install(TARGETS ${TARGET} EXPORT "${TARGET}Config"
        LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR})

set(config_install_dir ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
set(version_config "${CMAKE_CURRENT_BINARY_DIR}/${TARGET}ConfigVersion.cmake")

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
        "${version_config}"
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion)

set(LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
set(INCLUDE_INSTALL_DIR "include")

configure_package_config_file(${TARGET}Config.cmake.in
   ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}Config.cmake
   INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

install(FILES "${version_config}" DESTINATION "${config_install_dir}")
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${TARGET}Config.cmake" DESTINATION "${config_install_dir}")
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${TARGET}Target.cmake" DESTINATION "${config_install_dir}")

export(TARGETS ${TARGET} NAMESPACE "${TARGET}::" FILE "${TARGET}Target.cmake")

set_target_properties (${TARGET} PROPERTIES
        VERSION "${${TARGET}_VERSION_MAJOR}.${${TARGET}_VERSION_MINOR}.${${TARGET}_VERSION_PATCH}"
	SOVERSION "${${TARGET}_VERSION_MAJOR}")

#Create a deb package so that the library can be installed and used by users.
include("${CMAKE_SOURCE_DIR}/cmake_utils/CPack.cmake")