# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: rabyte <rabyte*gmail>

pkgname=gxconsole
pkgver=0.3
pkgrel=1
pkgdesc="A GTK-based monitor for system console messages"
arch=('i686' 'x86_64')
url="http://gxconsole.sourceforge.net/"
license=('GPL')
depends=('gksu')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('caba3c6929ff5176c37991c94900f8cf')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
