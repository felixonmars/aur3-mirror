# Maintainer: Leyorus <leyorus@gmail.com>
# Contributor: Leyorus <leyorus@gmail.com>
pkgname=mkvextract-gtk
pkgver=0.9.2
pkgrel=2
pkgdesc="Simple Linux GUI to extract tracks from matroska (mkv) files"
arch=(any)
conflicts=('mkvextract-gtk-git')
url="https://bitbucket.org/Leyorus/mkvextract-gtk/"
license=('GPL2')
depends=('mkvtoolnix-cli')
makedepends=('gcc' 'cmake' 'boost' 'gtkmm')
source="https://bitbucket.org/Leyorus/mkvextract-gtk/get/v0.9.2.tar.gz"
md5sums=('001c1be1d424fac72bdb2c804197b499')

build() {
	cd "$srcdir/Leyorus-$pkgname-8a15285933e8/"
	cmake . && make
}

package() {
	cd "$srcdir/Leyorus-$pkgname-8a15285933e8/"
	mkdir -p "$pkgdir/usr/bin/"
	cp mkvextract-gtk "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin"
}