# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=ramen
pkgver="0.6.2b"
pkgrel=1
epoch=
pkgdesc="A powerful node based video compositor."
arch=("i686" "x86_64")
url="http://www.ramenfx.org/"
license=('CDDL')
groups=()
depends=("eigen" "boost-libs" "qt" "openexr" "jasper" "libpng" "libtiff" "intel-tbb" "python2" "freetype2")
makedepends=("cmake" "boost")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/downloads/Eibriel/Ramen/vfx-code-0.6.2bB.tar.gz"
        "openimageio.gcc4.6.boost.filesystem3.patch"
        "ramen.Boost-1.46.ASL-GCC.CMake-StaticOpenImageIO-Hack.patch")
noextract=()
sha1sums=('911c834000d97e27888f7660224de111436bcbe4'
          '3ba2e497862f6b4436f467b7e5565b4b2d9c64bd'
          '7a0a1e127a8c14eae55a0d3e85148f94ecf3fd2e')

_openimageio_gitroot="git://github.com/OpenImageIO/oiio.git"
_openimageio_gitname="oiio"
_cortex_svntrunk="http://cortex-vfx.googlecode.com/svn/trunk/"
_cortex_svnmod="cortex-vfx"

build_openimageio_static() {
  cd "${srcdir}"
  if [[ -d "${_openimageio_gitname}" ]]; then
    msg "Updating local GIT repository..."
    cd "${_openimageio_gitname}"
    git clean -dfx
    git reset --hard
    git pull origin
  else
    msg "Cloning GIT repository..."
    git clone "${_openimageio_gitroot}" "${_openimageio_gitname}"
    cd "${_openimageio_gitname}"
  fi
  git checkout "RB-0.8"
  msg "Done."

  # Remove the unnecessary 'Insecure RPATH' of ${dist_dir}/lib.
  sed '/set (CMAKE_INSTALL_RPATH "${LIBDIR}")/d' -i "src/CMakeLists.txt"

  # patch for Boost Filesystem V3 and GCC 4.6
  patch -i "${srcdir}/openimageio.gcc4.6.boost.filesystem3.patch" -p1

  msg "Starting make..."
  make \
    dist_dir="dist" \
    BUILDSTATIC=1
}

get_cortex() {
  cd "${srcdir}"
  if [[ -d "${_cortex_svnmod}" ]]; then
    msg "Updating local SVN repository..."
    cd "${_cortex_svnmod}"
    svn cleanup
    svn revert -R
    svn up
  else
    msg "Checking Out SVN repository..."
    svn co "${_cortex_svntrunk}" "${_cortex_svnmod}"
    cd "${_cortex_svnmod}"
  fi
  msg "Done."
}

build_ramen() {
  cd "${srcdir}/vfx"
  patch -i "${srcdir}/ramen.Boost-1.46.ASL-GCC.CMake-StaticOpenImageIO-Hack.patch" -p1

  cd "${srcdir}/vfx/${pkgname}"
  [[ -d build ]] && rm -rf build
  mkdir build; cd build

  EIGEN_INCLUDE_DIR=$(pkg-config --cflags eigen2)
  EIGEN_INCLUDE_DIR="${EIGEN_INCLUDE_DIR#-I}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DEIGEN_INCLUDE_DIR="${EIGEN_INCLUDE_DIR}" \
    -DIECORE_INCLUDE_DIRS="${srcdir}/${_cortex_svnmod}/include" \
    -DOPENIMAGEIO_INCLUDE_DIRS="${srcdir}/${_openimageio_gitname}/dist/include" \
    -DOPENIMAGEIO_LIBRARIES="${srcdir}/${_openimageio_gitname}/dist/lib/libOpenImageIO.a" \
  ..
  make
}

build() {
  build_openimageio_static
  get_cortex
  build_ramen
}

package() {
  cd "${srcdir}/vfx/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -m755 "build/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
