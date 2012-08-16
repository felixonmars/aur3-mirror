#Contributor: allencch <allencch at hotmail dot com>
pkgname=weeder
pkgver=1.4.2
pkgrel=1
pkgdesc="Motif (transcription factor binding sites) discovery in sequences from coregulated genes of a single species"
arch=('i686')
url="http://159.149.109.9/modtools/"
license=('custom')
depends=("sh")
source=("http://159.149.109.9/modtools/downloads/${pkgname}${pkgver}.tar.gz")
md5sums=('07e09bb1423ee049a413705d232379a5')

build() {
	cd "${srcdir}/Weeder${pkgver}"
	sed -i "s|./FreqFiles|/opt/weeder/FreqFiles|g" "src/weederTFBS.c" "src/weederlauncher.c"
	./compileall
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/weeder"
	cd "${srcdir}/Weeder${pkgver}"
	install -m755 *.out "${pkgdir}/usr/bin"
	cp -r FreqFiles "${pkgdir}/opt/weeder"
	chmod 644 "${pkgdir}/opt/weeder/FreqFiles/"*
}
