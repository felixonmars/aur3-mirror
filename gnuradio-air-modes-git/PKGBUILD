pkgname=gnuradio-air-modes-git
_gitname=gr-air-modes
pkgdesc="Gnuradio Mode-S/ADS-B radio"
pkgver=3.6.r52.g95ff2ca
pkgrel=1
url="https://github.com/bistromath/gr-air-modes"
arch=('x86_64' 'i686' 'armv7h')
license=('bsd')
depends=('boost' 'gnuradio' 'orc' 'python2' 'python2-pyzmq')
makedepends=('cmake' 'git' 'swig')
source=("git://github.com/bistromath/gr-air-modes.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${_gitname}/build"
  cd "${_gitname}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
