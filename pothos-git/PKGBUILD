# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('pothos-git')
_pkgname="${pkgname%-*}"
pkgrel=1
pkgdesc="The Pothos project is a complete data-flow framework for creating topologies of interconnected processing blocks"
arch=('i686' 'x86_64')
url="http://www.pothosware.com/"
license=('')
makedepends=('cmake')
depends=('python' 'python-numpy' 'qt5-base' 'qwt' 'portaudio' 'soapysdr-git' 'poco')

source=("git+https://github.com/pothosware/pothos.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^pothos-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd $_pkgname
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd $_pkgname/build  
  make DESTDIR="$pkgdir/" install 
}
