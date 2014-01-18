# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=pkgbuild-reflection-git
_pkgname=pkgbuild_reflection
pkgver=28.2ea644c
pkgrel=1
pkgdesc='Tools for generating .AURINFO files and PKGBUILD data extraction (includes mkaurball)'
url="https://github.com/falconindy/${_pkgname}"
license=('unknown')
arch=('any')
depends=('python')
makedepends=('git')
provides=('pkgbuild-reflection')
conflicts=('pkgbuild-reflection')
source=("git+https://github.com/falconindy/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname%-git}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "${_pkgname%-git}"

	install -Dm755 compare.py "${pkgdir}/usr/bin/compare.py"
	install -Dm755 mkaurball "${pkgdir}/usr/bin/mkaurball"
	install -Dm755 parse_aurinfo.py "${pkgdir}/usr/bin/parse_aurinfo.py"
	install -Dm755 pkgbuild_reflection "${pkgdir}/usr/bin/pkgbuild_reflection"
	install -Dm755 reflect "${pkgdir}/usr/bin/reflect"
}
