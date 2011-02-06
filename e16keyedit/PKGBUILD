# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=e16keyedit
pkgver=0.7
pkgrel=1
pkgdesc="Standalone keybindings editor for enlightenment"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org/"
license=('MIT')
depends=('enlightenment>=1.0.1' 'gtk2')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/$pkgname-$pkgver.tar.gz)
md5sums=('9eb999852da128120f3cc64337d8e9e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
