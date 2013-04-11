# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=gigi-svn
pkgver=5894
pkgrel=1
pkgdesc="A C++ OpenGL GUI library (FreeOrion fork)"
arch=("i686" "x86_64")
url="http://www.freeorion.org/"
license=("LGPL2.1")
depends=("libltdl" "boost-libs>=1.47.0" "devil-ilut" "ogre" "sdl")
makedepends=("subversion" "cmake" "doxygen" "boost>=1.47.0")
source=("system.ltdl.patch"
        "devil.patch")
sha256sums=("fdcff06934cc78317c12b4b66da7c5c7252c68a9467584f5d850584384f689f5"
            "a4aee9407584d1e87ffaae83eaec7a902a5d07de446a9bfb44352ca605d22e05")

_svntrunk="https://freeorion.svn.sourceforge.net/svnroot/freeorion/trunk/FreeOrion/GG/"
_svnmod="$pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  svn export "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD HERE
  #

  # ltdl fixes
  patch -p1 -i "${srcdir}/system.ltdl.patch"

  # fix DevIL library link paths
  #sed -i "s/\(IL\(UT\)\?_LIBRAR\)Y/\1IES/g" src/CMakeLists.txt
  patch -p1 -i "${srcdir}/devil.patch"

  # python2 fixes
  while IFS= read -r -d $'\0' line; do
    sed -i "s_\(#!.*\(env \|bin/\)python\)[^[:space:]#]*_\12_" "$line"
  done < <(egrep -RlZ "#!.*(env |bin/)python" .)

  # fix documentation location
  sed -i "s/\(DESTINATION \)\(doc\)/\1share\/\2/" CMakeLists.txt

  # FreeOrion uses the Boost CMake framework
  cmake \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D BUILD_TUTORIALS=OFF \
    -D USE_DEVIL=ON \
    .
  # default options:
  # -D BUILD_STATIC=OFF
  # -D BUILD_SHARED=ON
  # -D BUILD_DEBUG=OFF
  # -D BUILD_MULTI_THREADED=ON
  # -D USE_DEVIL=OFF
  # -D BUILD_SDL_DRIVER=ON
  # -D BUILD_OGRE_DRIVER=ON
  # -D BUILD_OGRE_OIS_PLUGIN=ON
  # -D BUILD_DOCUMENTATION=ON
  #
  # -D PackageType=NoPackage
  #   The variable PACKAGE_TYPE determines which install commands are to be
  #   provided and therefore affects equally the files installed via both the
  #   install and package targets of make. Only the value NoPackage will select
  #   all components: headers, pkg-config files, shared libraries, static
  #   libraries, and documentation. The library install commands are specified
  #   via the included CMake listfiles in the FreeOrion source tree through
  #   cmake/Util.cmake in:
  #     library_all_variants -> library_variant -> install(...)
  #
  # unnecessary options:
  # -D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
  #   If the variable CMAKE_BUILD_TYPE is supported (only for make-based
  #   generators), then CMake will provide initial values for the variables
  #   CMAKE_(C|CXX)_(DEBUG|RELEASE|RELWITHDEBINFO|MINSIZEREL). These values
  #   depend on the compiler and will be empty for unknown compilers. However
  #   the defaults for GCC are:
  #     CMAKE_C_FLAGS_DEBUG:STRING=-g
  #     CMAKE_C_FLAGS_MINSIZEREL:STRING=-Os -DNDEBUG
  #     CMAKE_C_FLAGS_RELEASE:STRING=-O3 -DNDEBUG
  #     CMAKE_C_FLAGS_RELWITHDEBINFO:STRING=-O2 -g
  #   The Boost CMake framework used by FreeOrion, specifically
  #   cmake/Config.cmake, copies these values into the following variables:
  #     DEBUG_COMPILE_FLAGS   <- CMAKE_CXX_FLAGS_DEBUG
  #     RELEASE_COMPILE_FLAGS <- CMAKE_CXX_FLAGS_RELEASE
  #     DEBUG_LINK_FLAGS      <- CMAKE_SHARED_LINKER_FLAGS_DEBUG
  #     RELEASE_LINK_FLAGS    <- CMAKE_SHARED_LINKER_FLAGS_RELEASE
  #     ...
  #   After which the original CMake variables are cleared: set to an empty
  #   string.
  #
  #   Each of the included CMake listfiles in the FreeOrion source tree run the
  #   macro library_all_variants from cmake/Util.cmake with the following
  #   arguments:
  #     src/CMakeLists.txt                -> GiGi
  #     src/SDL/CMakeLists.txt            -> GiGiSDL
  #     src/Ogre/CMakeLists.txt           -> GiGiOgre
  #     src/Ogre/Plugins/CMakeLists.txt   -> GiGiOgrePlugin_OIS
  #   This macro library_all_variants in turn runs the macro library_variant
  #   with all possible permutations of the arguments (bound to ${ARG}):
  #     (LIBNAME)
  #     (STATIC|SHARED)
  #     (DEBUG|RELEASE)
  #     (MULTI_THREADED|SINGLE_THREADED)
  #   In turn, library_variant aggregates the compiler and linker flags into
  #   the variables THIS_VARIANT_COMPILE_FLAGS and THIS_VARIANT_LINK_FLAGS from
  #   the sources:
  #     ${THIS_VARIANT_(COMPILE|LINK)_FLAGS}
  #     ${THIS_LIB_${ARG}_(COMPILE|LINK)_FLAGS}
  #     ${${ARG}_(COMPILE|LINK)_FLAGS}
  #   The last source includes the variables:
  #     (DEBUG|RELEASE)_(COMPILE|LINK)_FLAGS
  #   These variables are eventually passed on to the rest of the toolchain via
  #   the CMake command:
  #     set_target_properties(
  #       ...
  #       COMPILE_FLAGS "${THIS_VARIANT_COMPILE_FLAGS}"
  #       ...
  #     )
  #
  #   If a macro with the name NDEBUG is defined, the macro
  #     void assert(int expression)
  #   is disabled.
  #
  # -D CMAKE_BUILD_TYPE=...
  #   As long as the variable CMAKE_BUILD_TYPE is supported, irrespective of
  #   its value (or if even defined), CMake will always provide the variables
  #   CMAKE_(C|CXX)_(DEBUG|RELEASE|RELWITHDEBINFO|MINSIZEREL). Furthermore
  #   since FreeOrion uses the Boost CMake framework, CMAKE_BUILD_TYPE has no
  #   actual effect upon the build type; rather define the variables
  #   BUILD_DEBUG or BUILD_RELEASE.
  #   Note that CFLAGS and CXXFLAGS are still honored; these are stored in the
  #   variables CMAKE_(C|CXX)_FLAGS which are not cleared by the included file
  #   cmake/Config.cmake. The COMPILE_FLAGS argument to set_target_properties
  #   specifies only additional flags; the full command line equivalent will
  #   be:
  #     ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} ${COMPILE_FLAGS} \
  #       -o foo.o \
  #       -c foo.cc
  #
  # -D CPACK_GENERATOR=...
  #   The "make package" target will, for each CPACK_GENERATOR, produce a
  #   software package containing everything installed via CMake's install
  #   commands. The FreeOrion CMake framework is configured to build GZIP and
  #   BZIP2 TAR archives by default, and RPM and DEB packages if possible.

  make
}

package() {
  cd "${srcdir}/${_svnmod}-build"

  GIGI_VERSION="$(sed -n 's/^set(\s*GIGI_VERSION\s\+\([0-9.]\+\)\s*)$/\1/ p' CMakeLists.txt)"
  provides=("${pkgname%-svn}=${GIGI_VERSION}")
  conflicts=("${pkgname%-svn}")

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
