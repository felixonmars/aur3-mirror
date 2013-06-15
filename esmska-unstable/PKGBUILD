# Maintainer: David Watzke <david@watzke.cz>
# Contributor: Ljukee <lukas.ryc@gmail.com>

_name=esmska
pkgname=esmska-unstable
pkgver=1.4
pkgrel=1
pkgdesc="Program for sending SMS over the Internet - the latest version"
arch=('any')
url="http://esmska.googlecode.com/"
license=('AGPL')
depends=('java-runtime')
conficts=('esmska')
provides=('esmska')
install=esmska.install
#source=("http://ripper.profitux.cz/esmska/beta/esmska-$pkgver.tar.gz"
source=("http://$_name.googlecode.com/files/$_name-$pkgver.tar.gz"
	"$_name.desktop")
sha256sums=('e239cb9b3fc2cc11f6d20a9952839868ca5a0bccea699663033beece48596310'
            'd934efd44ed0eef7b909e8f9150eb32d45b1a7d0c600f48fc14a696f76ff91a1')

build() {
	return 0
}

package() {
	cd "${srcdir}/$_name-${pkgver}"

	install -d "${pkgdir}/usr/share/java/esmska"
	cp -a * "${pkgdir}/usr/share/java/esmska"

	#.desktop + icon files
	install -D -m644 "${srcdir}/esmska.desktop" \
		"${pkgdir}/usr/share/applications/esmska.desktop"
	install -D -m644 "${srcdir}/esmska-${pkgver}/icons/esmska.png" \
		"${pkgdir}/usr/share/pixmaps/esmska.png"

	#executable file
	install -d -m755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/java/esmska/esmska.sh" \
		"${pkgdir}/usr/bin/$_name"

	#license
	install -D -m644 ${srcdir}/$_name-$pkgver/license/license.txt \
		${pkgdir}/usr/share/licenses/$_name/LICENSE
	install -D -m644 ${srcdir}/$_name-$pkgver/license/gnu-agpl.txt \
		${pkgdir}/usr/share/licenses/$_name/AGPL

	#removing unneeded
	rm ${pkgdir}/usr/share/java/esmska/esmska.exe
}
