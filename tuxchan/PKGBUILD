# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=tuxchan
pkgver=0.2.0
pkgrel=2
pkgdesc="TuxChan is a Linux desktop client for 4chan, the popular imageboard."
arch=('i686' 'x86_64')
url="http://tuxchan.barberaware.org"
license=('GPL3')
depends=('clutter' 'cairo' 'perlxml')
makedepends=('intltool' 'glib2')
source=(http://barberaware.org/frs/download.php/35/tuxchan-0.2.0.tar.gz)
md5sums=('59ae6f9b039685447de4c79178d60772')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
