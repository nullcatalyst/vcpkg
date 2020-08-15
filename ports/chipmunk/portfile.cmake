include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO slembcke/Chipmunk2D
    REF 87340c216bf97554dc552371bbdecf283f7c540e
    SHA512 9094017755e9c140aa5bf8a1b5502077ae4fb2b0a3e12f1114e86d8591a6188f89822ecc578a2b5e95f61c555018f1b3273fe50e833fe2daf30e94b180a3d07c
    HEAD_REF master
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    set(BUILD_SHARED OFF)
else()
    set(BUILD_SHARED ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_TESTS=OFF
        -DBUILD_DEMOS=OFF
        -DINSTALL_DEMOS=OFF
        -DBUILD_SHARED=${BUILD_SHARED}
        -DBUILD_STATIC=ON
        -DINSTALL_STATIC=ON
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
