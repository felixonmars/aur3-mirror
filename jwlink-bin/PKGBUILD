# Maintainer: Mihai Coman <mihai@m1x.ro>

pkgname=jwlink-bin
pkgver=1.9b11
pkgrel=1
pkgdesc="JWlink is a linker for x86 that can create 16, 32 and 64 bit binaries"
arch=('i686' 'x86_64')
url="http://www.japheth.de/JWlink.html"
license=('Sybase Open Watcom Public License')
source=(http://www.japheth.de/Download/JWlink/JWlink_v19b11_linux.zip)
makedepends=(unzip)
md5sums=('4ac26e7a35bad860f2fced087541408d')


package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/doc/jwlink/
	mkdir -p ${pkgdir}/usr/bin/
	install -m644 JWlink.htm History.txt License.txt Readme.txt ${pkgdir}/usr/share/doc/jwlink/
	install -m755 jwlink JWlib cvpack ${pkgdir}/usr/bin/
}
