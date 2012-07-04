# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=glestadv
_srcnam=glestae
pkgver=0.3.93
pkgrel=2
pkgdesc="Glest Advanced Engine is a community driven project which extends and improves on Glest."
arch=('i686' 'x86_64')
url="https://sourceforge.net/apps/trac/glestae/"
license=('GPL2')
depends=('sdl' 'libvorbis' 'openal' 'mesa' 'lua' 'physfs' 'glew')
makedepends=('cmake')
optdepends=('wxgtk: for optional gae_mapeditor, gae_g3dviewer, and glest_configurator'
            'libmxl2: for extra xml handling'
            'cppunit: for testing'
            'doxygen: for documentation')
conflicts=('glestae-svn' 'glestae-git')
install=glestadv.install
source=("http://downloads.sourceforge.net/${_srcnam}/${_srcnam}-src-${pkgver}.tar.bz2"
        'libpng-1.5.patch'
        'gcc-4.7.patch')
md5sums=('83fec41c3c163dfb8437df93e98b5901'
         '8b0418f6d5c3619d602b1ed8c2a309ae'
         '9019d1bd9aa17fc3583587686e15071c')

build() {
  cd ${_srcnam}-src-${pkgver}

  # Patch for libpng 1.5
  patch -p1 < "${srcdir}"/libpng-1.5.patch
  # Patch for gcc 4.7
  patch -p1 < "${srcdir}"/gcc-4.7.patch

  mkdir -p build
  cd build
    cmake -G "Unix Makefiles" \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
      -DCMAKE_BUILD_TYPE=Release .. || return 1

    make VERBOSE=1 || return 1
}

package() {
  cd ${_srcnam}-src-${pkgver}/build
  make install DESTDIR="$pkgdir" || return 1
}
