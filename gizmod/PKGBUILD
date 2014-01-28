# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=gizmod
pkgver=3.5
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Daemon for controlling input devices"
url="http://gizmod.sourceforge.net"
license="APACHE"
depends=('alsa-lib' 'boost' 'libvisual' 'libxext' 'libsm' 'python2')
makedepends=('gawk' 'boost-build' 'cmake' 'gcc' 'git')
install=gizmod.install
source=()
md5sums=()
_gitroot="https://github.com/jtriley/gizmod.git"
_gitname="gizmod"


build() {
  cd "${srcdir}"

  if [[ -d ${_gitname} ]]; then
    cd ${_gitname}
    git pull origin
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  mkdir build
  cd build

  LDFLAGS=-lboost_system cmake -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D DATA_INSTALL_DIR=/usr/share/$pkgname \
    -D PLUGIN_INSTALL_DIR=/usr/lib/$pkgname \
    -D SYSCONF_INSTALL_DIR=/etc \
    -D PYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so \
    -D PYTHON_INCLUDE_DIR=/usr/include/python2.7 ..

  # Manually change paths since cmake doesn't seem to read the env vars
  find -type f -exec sed -ie 's|/usr/etc|/etc|g' {} \;

  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}