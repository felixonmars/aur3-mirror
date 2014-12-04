# Maintainer: Sergey Vidyuk <sir.vestnik@gmail.com>

_pkgname=mongoose-cpp
pkgname=$_pkgname-git
pkgver=1122.60e6218
pkgrel=1
pkgdesc="Small and quick-to-use web server C++ wrapper - git development version"
arch=('i686' 'x86_64')
url="https://github.com/Gregwar/mongoose-cpp"
license=('MIT')
groups=()
depends=('openssl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" mongoose mongoose-git)
source=("${_pkgname}::git+git://github.com/Gregwar/mongoose-cpp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname/"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWEBSOCKET=On \
        -DBUILD_SHARED_LIBS=On \
        ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
