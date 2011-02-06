# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=dia-gnome-network-icons
pkgver=0.1
pkgrel=1
pkgdesc="GNOME based networking shapes for dia."
arch=(any)
url="http://gnomediaicons.sourceforge.net/"
license=('custom')
depends=('dia')
groups=('dia-shapes')
source=(http://gnomediaicons.sourceforge.net/files/rib-network-v$pkgver.tar.gz)
md5sums=('a8bdbf715746ce1f33c4a3707071ff47')

build() {
	mkdir -p $pkgdir/usr/share/dia/shapes
	mkdir -p $pkgdir/usr/share/dia/sheets
	cp -a $srcdir/shapes/RIB-Network $pkgdir/usr/share/dia/shapes/
	install -m0644 $srcdir/sheets/rib_network.sheet $pkgdir/usr/share/dia/sheets/
}
