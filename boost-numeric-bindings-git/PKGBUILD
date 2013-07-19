# Maintainer: Nicolas Stalder <nicolas.stalder@gmail.com>
pkgname=boost-numeric-bindings-git
pkgver=1f994e8
pkgrel=1
pkgdesc="Numeric Library Bindings for Boost UBlas"
arch=('any')
url="http://mathema.tician.de/node/391"
license=('LGPL')
makedepends=('git' 'boost' 'gcc')
source=("git+http://git.tiker.net/trees/boost-numeric-bindings.git")
md5sums=('SKIP')
_gitname='boost-numeric-bindings'

build() {
  cd $_gitname
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd $_gitname
  make install
} 
