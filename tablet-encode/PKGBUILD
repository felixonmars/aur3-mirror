# Contributor: Laurent Almeras <laurent.almeras@gmail.com>

pkgname=tablet-encode
pkgver=2.30
pkgrel=1
pkgdesc="movie encoder for Maemo-based devices"
arch=('i686' 'x86_64')
url="http://mediautils.garage.maemo.org/tablet-encode.html"
license=('Artistic')
depends=(mplayer)
optdepends=("gtk2-perl: for GUI")
makedepends=()
source=(http://garage.maemo.org/frs/download.php/6892/$pkgname-$pkgver.tar.gz)
md5sums=('cc81a2a375724543cf40ea2ed97d3e6a')

build() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/share/$pkgname/doc

	install tablet-encode $startdir/pkg/usr/bin
	install README.txt $startdir/pkg/usr/share/$pkgname/doc
	install ARTISTIC $startdir/pkg/usr/share/$pkgname/doc
}
