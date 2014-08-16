pkgname=cockatrice-git
pkgver=0
pkgrel=1
pkgdesc="A multiplatform application for playing card games such as Magic: The Gathering over a network."
arch=('i686' 'x86_64')
url="http://github.com/Daenyth/Cockatrice"
license=('GPL2')
depends=('qt5-svg' 'qt5-multimedia' 'qt5-tools' 'protobuf')
makedepends=('git' 'cmake')
_gitroot="git://github.com/Daenyth/Cockatrice.git"
source=("${pkgname}"::"${_gitroot}")
md5sums=('SKIP')
 
# Set this to 1 to include servatrice in the package
_COMPILE_SERVATRICE=0
 
pkgver() {
  cd "${pkgname}"
  # https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
  git describe --long --tags | sed 's/-/./g'
}
 
build() {
  cd "${srcdir}/${pkgname}"
 
  rm -rf build
  mkdir build
  cd build
 
  if (( _COMPILE_SERVATRICE )); then
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DWITH_SERVER=1 ..
  else
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ ..
  fi
  make
}
 
package() {
  cd "${srcdir}/${pkgname}/build"
 
  make DESTDIR="$pkgdir" install
}