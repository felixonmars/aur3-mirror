pkgname=dmtcp
pkgver=2.0
pkgrel=1
pkgdesc="DMTCP transparently checkpoints the state of multiple simultaneous applications"
url="http://dmtcp.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL3")
source=("http://downloads.sourceforge.net/project/${pkgname}/dmtcp-2.x/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f8a84f7f4fb941cf8f3f3c62aee8a8a6ebc7a8bda5dac6346c30f2f8e3f6535faf7c46a2956368ea84146fa3cf3548775c0b2c6f694c2fba23cd64bc3df4dacc')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix='/usr/'
	make
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "$pkgdir/usr/share/man/man1/"
	rename .gz '' *.gz
}
