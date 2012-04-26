# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=sila
pkgver=0.2
pkgrel=2
pkgdesc="A simple jack LADSPA Host/Browser"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/guitarix/"
license=('GPL')
depends=('jack' 'gtkmm' 'ladspa')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/guitarix/web/$pkgname-$pkgver.tar.bz2")
md5sums=('8cfaf56dd8c97518a3cbce74652496b6')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
