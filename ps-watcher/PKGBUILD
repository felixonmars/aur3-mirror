# Maintainer: TDY <tdy@archlinux.info>

pkgname=ps-watcher
pkgver=1.08
pkgrel=1
pkgdesc="A Perl implementation of system monitoring"
arch=('any')
url="http://ps-watcher.sourceforge.net/"
license=('GPL')
depends=('perl-config-inifiles')
source=(http://downloads.sourceforge.net/ps-watcher/ps-watcher-$pkgver.tar.gz)
md5sums=('fd350ba30716ee5727e53c0f7496f16f')

build() {
  cd "$srcdir/ps-watcher-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd "$srcdir/ps-watcher-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
