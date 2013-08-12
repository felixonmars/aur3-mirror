# Maintainer: Terry Zink <bezerker at bezerker dot org>

pkgname=pifs-git
_gitname=pifs
pkgver=20130812
pkgrel=1
pkgdesc="Never worry about data again!"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pifs"
license=('GPL3')
makedepends=('git')
source=(git://github.com/philipl/pifs.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  git describe --always | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${_gitname}
  ./autogen.sh --prefix=/usr
  make

}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="$pkgdir/" install
}
