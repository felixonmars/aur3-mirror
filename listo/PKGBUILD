# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=listo
pkgver=0.9.7.36
pkgrel=1
pkgdesc="A task manager for mobilistas. TODO."
arch=('i686' 'x86_64')
url="http://lis.to"
license=('GPL3')
depends=('java-runtime')
source=(http://listo.googlecode.com/files/${pkgname}.${pkgver}.jar.zip listo listo.desktop)

build() {
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/java/listo
	mkdir -p $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications

	cd $srcdir
	install -D -m 755 ${pkgname} $pkgdir/usr/bin || return 1
	install -D -m 644 ${pkgname}.jar $pkgdir/usr/share/java/${pkgname} || return 1
	install -D -m 644 ${pkgname}.desktop $pkgdir/usr/share/applications || return 1

	unzip  -jo ${pkgname}.jar images/logo.png
	install -D -m 644 logo.png $pkgdir/usr/share/pixmaps/${pkgname}.png || return 1
}
md5sums=('90e305d34cfa2642c01ca2a7ed4621c1'
         '4b131e0bb2b1a47c270ada2614e5e3b4'
         'd01ce638c31cae6b8115c9eacaef549e')
sha256sums=('54890f16f2458c6d699db8d565a33513bb40afabb11a1beda736b9f3aae8a714'
            'c6f2c0acbfea0ff270c9d30c3ae5c178d5560a649d59f32b98359b90c7b89f5c'
            '68dbf6522e433eed66901d2576c32ab574ed01c9d85e0cf96ee009142cd0a695')
