# Maintainter: Joop Kiefte <joop@kiefte.eu>
pkgname=sint98
pkgver=1.6
pkgrel=2
pkgdesc="Sint Nicolaas is a small PC game about Sinterklaas (Saint Nicholas)"
arch=('i686' 'x86_64')
url=http://www.wieringsoftware.nl/sint/
license=('custom:wiering')
depends=('dosbox')
source=("sint98.zip::http://sint.sourceforge.net/sint98.zip"
	"sint.sh")
md5sums=('3994534feaf64e0d90c8cbf6766d23e7'
	 '30b0a2806fc108535210f107d9e33095')

build() {
	cd "${srcdir}"
	sed -i "s@replaceme@/usr/share/games/${pkgname}/base/@" sint.sh
}

package() {
	cd "${srcdir}"

	install -Dm666 SINT.EXE "${pkgdir}/usr/share/games/${pkgname}/base/sint.exe"
	install -Dm644 FILE_ID.DIZ "${pkgdir}/usr/share/games/${pkgname}/base/FILE_ID.DIZ"
	install -Dm755 sint.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

