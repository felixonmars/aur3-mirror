# Contributor: TheBenj88 <thebenj88 *AT* gmail *DOT* com>
# Maintainer: TheBenj88 <thebenj88 *AT* gmail *DOT* com>
pkgname=oggchan
pkgver=1.2
pkgrel=1
pkgdesc="Converts and embeds music into image files. Can also batch extract media from such images. Compatable with 4chan sounds."
arch=('any')
url="http://sourceforge.net/projects/oggchan/"
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/oggchan/${pkgname}-${pkgver}.tar.gz")
sha256sums=('93ee048b10ecbfb900e431be810639f71b18ffd681163cda4cee267c6b0c5931')

package() {
	install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/binary/Oggchan.jar ${pkgdir}/usr/share/${pkgname}/Oggchan.jar
	install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/binary/lib/appframework-1.0.3.jar ${pkgdir}/usr/share/${pkgname}/lib/appframework-1.0.3.jar
	install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/binary/lib/swing-worker-1.1.jar ${pkgdir}/usr/share/${pkgname}/lib/swing-worker-1.1.jar
	
	sed -i 's|Oggchan.jar|/usr/share/oggchan/Oggchan.jar|g' ${srcdir}/${pkgname}-${pkgver}/binary/runme.linux.sh
	install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/binary/runme.linux.sh ${pkgdir}/usr/bin/oggchan
}

