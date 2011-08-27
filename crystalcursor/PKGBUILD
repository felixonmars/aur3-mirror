# Contributor: Kittipong Piyawannp <bow_der_kleine@yahoo.de>
pkgname=crystalcursor
pkgver=1.1.1
pkgrel=1
pkgdesc="Crystal X-Cursor theme"
arch=(i686 x86_64 ppc)
url="http://www.fosk.it/mart/index.php/Graphics"
license=('LGPL')
source=(http://www.fosk.it/mart/files/Crystalcursors.tar.bz2)
md5sums=('bbac6729334538ce15e3cc2c59962cfb') #generate with 'makepkg -g'

build() {
  cd "$srcdir/Crystalcursors"
  make || return 1
  make DESTDIR="$pkgdir/" install
}

