# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photo
pkgver=0.9.1
pkgrel=3
pkgdesc="A fast, simple, good looking, yet powerfull and highly configurable image viewer."
arch=('i686' 'x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'phonon' 'qt4>=4.7')
makedepends=('cmake')
install=$pkgname.install
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz
        $pkgname.install)
md5sums=('1317a9243b9e7aa89b2554bcb0af9093'
         '5871e8e968e0a6c68538553795ee331e')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}