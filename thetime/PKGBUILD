# Contributor: Oliver Mader <dotb52 at gmail dot com>

pkgname=thetime
pkgver=0.2
pkgrel=1
pkgdesc="A tiny X app to draw the current date and time directly onto the root window"
arch=('i686' 'x86_64')
url="http://reaktor42.de"
license=('GPL')
depends=(libxft)
source=(http://reaktor42.de/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2)
md5sums=('5b2abc9f035b4883adff3802b84c6f7b')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
