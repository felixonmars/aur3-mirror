# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Archie <xMickael@ifrance.com>
pkgname=idiet
pkgver=1.0.5
pkgrel=2
pkgdesc="a diet software that can help you choose, customize and follow a diet"
depends=('java-runtime')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/iDiet%20${pkgver}/iDiet-${pkgver}.tar.gz"
	"idiet"
	"idiet.desktop"
	"idiet.png")
url="http://idiet.sourceforge.net"
md5sums=('c228c27c3dfc9a14088a357d8d8f816c'
         '6b42ce8ce7e6ff3339c64fb8bce11499'
         '2a33946c31c00bb08ed2bea19aa1cd20'
         '00b9fbce182565f06304fbb03b0677de')

package() {
	install -d ${pkgdir}/usr/share/java/idiet/{docs,lib} \
		${pkgdir}/usr/bin \
		${pkgdir}/usr/share/{applications,pixmaps}

	install -Dm644 ${srcdir}/iDiet-${pkgver}/docs/ReadMe.txt ${pkgdir}/usr/share/java/idiet/docs/ReadMe.txt
	install -Dm644 ${srcdir}/iDiet-${pkgver}/lib/* ${pkgdir}/usr/share/java/idiet/lib/
	install -Dm644 ${srcdir}/iDiet-${pkgver}/{iDiet.jar,README.TXT,Authors,ChangeLog,GPL,VERSION} ${pkgdir}/usr/share/java/idiet/
	install -Dm755 ${srcdir}/idiet ${pkgdir}/usr/bin/
	install -Dm644 ${srcdir}/idiet.desktop ${pkgdir}/usr/share/applications/
	install -Dm644 ${srcdir}/idiet.png ${pkgdir}/usr/share/pixmaps/
}
#http://sourceforge.net/projects/idiet/files/idiet/iDiet%201.0.5/iDiet-1.0.5.tar.gz/download
