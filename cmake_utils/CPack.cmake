set(MAJOR_VERSION ${PROJECT_VERSION_MAJOR})
set(MINOR_VERSION ${PROJECT_VERSION_MINOR})
set(PATCH_VERSION ${PROJECT_VERSION_PATCH})

# More detailed information could be found using link below
# https://cmake.org/cmake/help/git-stage/module/CPackDeb.html

if(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
    include(InstallRequiredSystemLibraries)

    set(CPACK_SET_DESTDIR "on")
    set(CPACK_PACKAGING_INSTALL_PREFIX "/tmp")
    set(CPACK_GENERATOR "DEB")

    set(CPACK_PACKAGE_DESCRIPTION "HelloWorld")
    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "HelloWorld library showing complete library installation and used by other users")
    set(CPACK_PACKAGE_VENDOR "Saravana Raja")
    set(CPACK_PACKAGE_CONTACT "Saravana Raja")
    set(CPACK_PACKAGE_VERSION_MAJOR "${MAJOR_VERSION}")
    set(CPACK_PACKAGE_VERSION_MINOR "${MINOR_VERSION}")
    set(CPACK_PACKAGE_VERSION_PATCH "${PATCH_VERSION}")
    set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}_${MAJOR_VERSION}.${MINOR_VERSION}.${CPACK_PACKAGE_VERSION_PATCH}")
    set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}_${MAJOR_VERSION}.${MINOR_VERSION}.${CPACK_PACKAGE_VERSION_PATCH}")

    set(CPACK_DEB_COMPONENT_INSTALL ON)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "")

    # for deb cpack extension we could use ipk or deb package extension
    set(PACKAGE_EXTENSION "deb")
    set(CPACK_DEBIAN_FILE_NAME ${PROJECT_NAME}_${MAJOR_VERSION}.${MINOR_VERSION}.${CPACK_PACKAGE_VERSION_PATCH}_${CMAKE_SYSTEM_PROCESSOR}.${PACKAGE_EXTENSION})

    set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
    set(CPACK_DEBIAN_PACKAGE_SECTION "")
    set(CPACK_DEBIAN_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})

    include(CPack)

endif()