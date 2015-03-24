# Maintainer: Beej Jorgensen <beej@beej.us>
# Maintainer: .@.
pkgname=wavemon
pkgver=0.7.6
pkgrel=1
pkgdesc="Ncurses-based monitoring application for wireless network devices"
arch=('i686' 'x86_64')
url="http://eden-feed.erg.abdn.ac.uk/wavemon/"
license=('GPL')
depends=('ncurses' 'libcap')
source=("https://github.com/uoaerg/wavemon/archive/v${pkgver}.tar.gz")
md5sums=('cd0049f174745d32b4fdf3b63d897bad')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # This hackery is because the Makefile expects pthread to be in the
  # CFLAGS. Is there a bettery way to do this?
  CFLAGS="$CFLAGS -O2 -Wall -pthread" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
