# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=hamcrest
pkgver=1.3
pkgrel=1
pkgdesc="A library of matcher objects"
arch=('i686' 'x86_64')
url="http://hamcrest.googlecode.com/"
license=('BSD')
depends=('java-runtime')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-all-${pkgver}.jar)
noextract=('*.jar')

package() {
	cd $srcdir

	install -D -m644 ${pkgname}-all-${pkgver}.jar \
		$pkgdir/usr/share/java/$pkgname-$pkgver.jar
	ln -sf $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname.jar
}

md5sums=('ae5102286b5720dd286d6b606cb891e2')
sha256sums=('4877670629ab96f34f5f90ab283125fcd9acb7e683e66319a68be6eb2cca60de')
