# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=gstreamer-java
pkgver=1.5
pkgrel=1
pkgdesc="An unofficial/alternative set of java bindings"
arch=('i686' 'x86_64')
url="http://gstreamer-java.googlecode.com/"
license=('GPL')
depends=('java-runtime' 'jna' 'gstreamer0.10')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-$pkgver.jar gst-j.bin)
noextract=('*.jar')

build() {
	cd $srcdir

	install -D -m755 gst-j.bin $pkgdir/usr/bin/gst-j
	install -D -m644 ${pkgname}-$pkgver.jar \
		$pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar || return 1
	ln -sf $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
}

md5sums=('73beb7e33f1990485c49c5cfeef781ef'
         'c3012ff43a539c7f3d06162d31023314')
sha256sums=('c2abd6ddcb151e29973ff166ccff44ca8a6731bf62363440f913f4a39657519f'
            '7fd3f8ec94302f6c218aa35fc97ef302e2962e5b9b353f24bc7fe8b50b4bf26f')
