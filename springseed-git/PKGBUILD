# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

pkgname=springseed-git
pkgver=1.1.r10.g9b6351f
pkgrel=1
pkgdesc="Simply awesome note taking."
arch=('any')
url="http://getspringseed.com/"
license=('MIT')
depends=('node-webkit' 'udisks')
makedepends=('coffee-script' 'nodejs' 'git')
source=("${pkgname}::git+https://github.com/michealharker/${pkgname%-git}.git"
	"${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.svg")
md5sums=('SKIP'
         '6dba6b9fa456bee5247ee5402b8c93ec'
         '82f981d4df35a304ba37c24db39c4eb7'
         '09f644324e9ece797605f1d2f4fd4424')

pkgver() {
	cd "${pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	npm install .
	cake build
	zip -r ../${pkgname}.nw *
}

package() {
	install -Dm0755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm0644 ${pkgname}.nw ${pkgdir}/usr/share/${pkgname}/${pkgname}.nw
	install -Dm0644 ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm0644 ${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -Dm0644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm0644 ${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}/${pkgname}.svg
}
