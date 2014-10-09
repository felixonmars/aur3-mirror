## Maintainer: Izumi Natsuka
pkgname=ods2util
pkgdesc='Utility to read the On-Disk Structure Level 2(ODS2) format disk volumes created on VMS'
arch=('i686' 'x86_64')
pkgrel=1
pkgver=1.3hb
depends=('glibc')
license=('custom')
url='http://www.vms2linux.de/ods2util.html'
source=('http://www.vms2linux.de/ods2util.zip')
sha1sums=('266daace2979cdb832d999b139583f5c30a33ff7')
md5sums=('d464cf7f1e855535115bb56c476a3cfe')
sha256sums=('381dcc07b72e3d2d6e4c40f280ab718a12d577b28cbe5a0451bcdb8ef244cffd')

build() {
	make -f makefile.unix CCFLAGS="${CFLAGS}"
}

package() {
	install -dm755 "${pkgdir}"/usr/{bin,share/{licenses,doc/"${pkgname}"}}
	install -pDm644 aareadme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -pDm644 aareadme.too "${pkgdir}/usr/share/doc/${pkgname}/README.too"
	install -pDm644 aareadme.hb "${pkgdir}/usr/share/doc/${pkgname}/README.hb"
	install -pm755 ods2 "${pkgdir}/usr/bin"
	ln -srf "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}"
}
