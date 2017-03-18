configure_file(${CMAKE_CURRENT_SOURCE_DIR}/ft2exec.in ${CMAKE_CURRENT_BINARY_DIR}/ft2exec)

ExternalProject_Add(freetype2
    DEPENDS zlib
    GIT_REPOSITORY "git://git.sv.gnu.org/freetype/freetype2.git"
    GIT_TAG 3e79254ae73ba4e5f951967b42d38b0aa1460af8
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/ft2exec <SOURCE_DIR>/configure
        --build=${HOST_ARCH}
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --without-harfbuzz
        --without-png
        --with-sysroot=${MINGW_INSTALL_PREFIX}
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${MINGW_INSTALL_PREFIX}/bin/freetype-config ${CMAKE_INSTALL_PREFIX}/bin/freetype-config
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

#force_rebuild_git(freetype2)
autogen(freetype2)
