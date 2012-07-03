# Maintainer: Maciej Ciemborowicz <pub@ciemborowicz.pl>

pkgname=libtermkey0.14
pkgver=0.14
pkgrel=2
pkgdesc="Library for easy processing of keyboard entry from terminal-based programs"
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/libtermkey/"
license=('MIT')
provides=('libtermkey')
options=(!libtool)
source=(http://www.leonerd.org.uk/code/libtermkey/libtermkey-$pkgver.tar.gz)
md5sums=('e08ce30f440f9715c459060e0e048978')

build() {
  cd "$srcdir/libtermkey-$pkgver"
  make
}

package() {
  cd "$srcdir/libtermkey-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/libtermkey/LICENSE
}

# vim:set ts=2 sw=2 et:
