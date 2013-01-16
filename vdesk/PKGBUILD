# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=vdesk
pkgver=1.2
pkgrel=2
pkgdesc="A lightweight virtual desktop manager"
arch=('i686' 'x86_64')
url="http://offog.org/code/vdesk.html"
license=('GPL')
depends=('libx11')
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('8c434dc188c868f19e57674074489481')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README "$pkgdir/usr/share/vdesk/README"
}

# vim:set ts=2 sw=2 et:
