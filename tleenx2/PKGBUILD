# Contributor: 3ED <krzysztof1987 at google mail>

pkgname=tleenx2
pkgver=20060309
pkgrel=4
arch=(i686 x86_64)
pkgdesc="TleenX2 is opened client of network Tlen.pl on gtk2 "
depends=('gtk2' 'libtlen' 'libxss')
source=(http://downloads.sf.net/sourceforge/tleenx/TleenX2-$pkgver.tar.gz)
url="http://sourceforge.net/projects/tleenx/"
license=(GPL)
sha256sums=('2c89ee4974a0f34561391b43c505c1a5e6f75dc8e102718d34789709733d507e')

build() {
  cd "$startdir/src/TleenX2-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$startdir/src/TleenX2-$pkgver"
  make DESTDIR=$startdir/pkg install
}
