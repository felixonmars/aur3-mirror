# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=aewan
pkgver=1.0.01
pkgrel=3
pkgdesc="A multi-layered ascii-art/animation editor that produces both stand-alone cat-able art files"
arch=('i686' 'x86_64')
url="http://aewan.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'zlib')
changelog='ChangeLog'
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('89545338d1eba311297b520f9dc1b976')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
