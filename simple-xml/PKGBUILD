# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=simple-xml
pkgver=2.6.2
pkgrel=1
pkgdesc="XML serialization and configuration framework for Java"
arch=('i686' 'x86_64')
url="http://simple.sourceforge.net/"
license=('LGPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/simple/${pkgname}-${pkgver}.tar.gz)

package() {
	mkdir -p $pkgdir/usr/share/java/${pkgname}
	
	cd $srcdir/${pkgname}-${pkgver}/jar
	install -D -m 644 ${pkgname}-${pkgver}.jar $startdir/pkg/usr/share/java/${pkgname}
	ln -sf ${pkgname}-${pkgver}.jar $startdir/pkg/usr/share/java/${pkgname}/${pkgname}.jar
}

md5sums=('67ce59e5052e33256cc148e30fe1d4cd')
sha256sums=('8fdc2f5f9c45cde8db19d8508a2ccf324dff841628d4c46899320861baec99bb')
