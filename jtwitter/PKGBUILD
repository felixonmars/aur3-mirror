# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=jtwitter
pkgver=1.8.6
pkgrel=1
pkgdesc="A small java library providing easy access to the Twitter API"
arch=('any')
url="http://www.winterwell.com/software/jtwitter.php"
license=('LGPL')
depends=('java-runtime')
source=(http://www.winterwell.com/software/$pkgname/$pkgname.jar)
noextract=('*.jar')

package() {
	cd $srcdir

	install -D -m644 ${pkgname}.jar $pkgdir/usr/share/java/$pkgname.jar
}

md5sums=('0e3083741ff553a5bd018de8859269f1')
sha256sums=('141cd01e0690dc035230653dcef2c887421f1eacf5f12e70ea001de7fb66f337')
