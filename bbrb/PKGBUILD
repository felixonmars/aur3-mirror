# Maintainer: TDY <tdy@gmx.com>

pkgname=bbrb
pkgver=0.4.1
pkgrel=2
pkgdesc="A graphical background manager for Blackbox and its variants"
arch=('i686' 'x86_64')
url="http://bbrb.sourceforge.net/"
license=('GPL')
depends=('imlib')
optdepends=('esetroot: use esetroot backend'
            'xv: use xv backend')
install=bbrb.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b20308677174549ba70804c98912eaf2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
