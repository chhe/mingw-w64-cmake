function(force_rebuild _name)
    ExternalProject_Add_Step(${_name} force-rebuild
        DEPENDEES build
        COMMAND ${EXEC} rm -f
            "<SOURCE_DIR>-stamp/*-autoreconf"
            "<SOURCE_DIR>-stamp/*-autogen"
            "<SOURCE_DIR>-stamp/*-configure"
            "<SOURCE_DIR>-stamp/*-build"
            "<SOURCE_DIR>-stamp/*-patch"
        ALWAYS 1
    )
endfunction()

function(force_rebuild_git _name)
    if(ENABLE_VCS_UPDATES)
        ExternalProject_Add_Step(${_name} force-update
            DEPENDEES download
            DEPENDERS update patch
            COMMAND git reset --hard @{u}
                COMMAND git pull
            WORKING_DIRECTORY <SOURCE_DIR>
            ALWAYS 1
            LOG 1
        )

        force_rebuild(${_name})
    endif()
endfunction()

function(force_rebuild_svn _name)
    if(ENABLE_VCS_UPDATES)
        ExternalProject_Add_Step(${_name} force-update
            DEPENDEES download
            DEPENDERS update patch
            COMMAND svn revert -R .
            COMMAND svn up
            WORKING_DIRECTORY <SOURCE_DIR>
            ALWAYS 1
            LOG 1
        )

        force_rebuild(${_name})
    endif()
endfunction()

function(force_rebuild_hg _name)
    if(ENABLE_VCS_UPDATES)
        ExternalProject_Add_Step(${_name} force-update
            DEPENDEES download
            DEPENDERS update patch
            COMMAND hg update --clean
            WORKING_DIRECTORY <SOURCE_DIR>
            ALWAYS 1
            LOG 1
        )

        force_rebuild(${_name})
    endif()
endfunction()

function(autogen _name)
    ExternalProject_Add_Step(${_name} autogen
        DEPENDEES download update patch
        DEPENDERS configure
        COMMAND ${EXEC} ./autogen.sh -V
        WORKING_DIRECTORY <SOURCE_DIR>
        LOG 1
    )
endfunction()

function(autoreconf _name)
    ExternalProject_Add_Step(${_name} autoreconf
        DEPENDEES download update patch
        DEPENDERS configure
        COMMAND ${EXEC} autoreconf -fi
        WORKING_DIRECTORY <SOURCE_DIR>
        LOG 1
    )
endfunction()

foreach(package
    crossc
    icu
    shaderc
    vulkan
    libsoxr
    libzimg
    angle
    gmp
    xz
    lzo
    uchardet
    rubberband
    zlib
    bzip2
    libzip
    libjpeg
    lcms2
    lame
    ogg
    vorbis
    opus
    speex
    libmodplug
    libvpx
    xvidcore
    game-music-emu
    libgpg_error
    libgcrypt
    libpng
    x264
    libdvdcss
    libdvdread
    libdvdnav
    libiconv
    sdl2
    sdl2_mixer
    sdl2_image
    luajit
    openal-soft
    fribidi
    expat
    boost
    wxWidgets
    libarchive
    freetype2
    sdl2_ttf
    taisei
    libaacs
    libbdplus
    libbluray
    harfbuzz
    libass
    ffmpeg
    mujs
    mpv
)
    include(${CMAKE_CURRENT_SOURCE_DIR}/${package}.cmake)
    message(STATUS "Parsing package ${package}")
endforeach()
