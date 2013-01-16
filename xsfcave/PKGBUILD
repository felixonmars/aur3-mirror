# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: nut543 <kfs1@online.no>

pkgname=xsfcave
pkgver=0.5
pkgrel=2
pkgdesc="An X11 sfcave clone where you survive in a tunnel by avoiding walls and obstacles"
arch=('i686' 'x86_64')
url="http://xsfcave.idios.org/"
license=('custom')
depends=('libxext' 'libsm')
source=(http://download.sourceforge.net/scrap/$pkgname-$pkgver.tar.gz)
md5sums=('8df2f3192af1628b2671100611dd2c75')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
