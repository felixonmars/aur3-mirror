# Contributor: Ermak <ermak@email.it>
pkgname=rdesktop-brute
pkgver=1.5.0
pkgrel=1
pkgdesc="Rdesktop client patched to brute-force Microsoft Terminal Servers"
arch=('i686' 'x86_64')
url="http://www.foofus.net/jmk/rdesktop.html"
license=('GPL')
provides=('rdesktop=1.5.0')
conflicts=('rdesktop')
source=(http://dfn.dl.sourceforge.net/sourceforge/rdesktop/rdesktop-$pkgver.tar.gz http://www.foofus.net/jmk/tools/rdp-brute-force-r805.diff)
md5sums=('433546f60fc0f201e99307ba188369ed'
         '8b01088f59626bd046fe24d4160ec1b4')
build() {
  cd "$srcdir/rdesktop-$pkgver"
  patch -Np1 -i ../rdp-brute-force-r805.diff || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
