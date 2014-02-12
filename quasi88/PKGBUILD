# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=quasi88
pkgver=0.6.4
pkgrel=1
pkgdesc="NEC PC-8801 Emulator"
arch=('i686' 'x86_64')
url="http://www.eonet.ne.jp/~showtime/quasi88/"
license=('BSD')
depends=('gcc-libs' 'libxext')
source=("http://www.eonet.ne.jp/~showtime/quasi88/release/quasi88-${pkgver}.tgz")

build() {
	cd "${srcdir}/quasi88-${pkgver}"
	make ARCH=generic
}

package() {
	cd "quasi88-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	make BINDIR="${pkgdir}/usr/bin" install
	install -Dm644 document/QUASI88.TXT "${pkgdir}/usr/share/licenses/${pkgname}/QUASI88.TXT"
}

md5sums=('21d268aaa290471f60142fea49485010')
