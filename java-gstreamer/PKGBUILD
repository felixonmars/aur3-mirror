# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>
_original_name=gstreamer-java
pkgname=java-gstreamer
pkgver=1.0
pkgrel=1
pkgdesc="An unofficial/alternative set of java bindings"
arch=('i686' 'x86_64')
url="http://gstreamer-java.googlecode.com/"
license=('GPL')
depends=('java-runtime' 'jna')
source=(http://${_original_name}.googlecode.com/files/${_original_name}-bin-$pkgver.jar)
noextract=('*.jar')
md5sums=('f057c02e89e24876b67cfdeb202ac58b')
sha1sums=('667c82b4ef6d87e2b19f838723560b206081a303')

build() {
	cd $srcdir

	install -D -m644 ${_original_name}-bin-$pkgver.jar \
		$pkgdir/usr/share/java/$pkgname-$pkgver.jar || return 1
	ln -sf /usr/share/java/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname.jar
}
