# Maintainer: Viech <viech unvanquished net>

pkgname=crunch-unv-git
pkgver=v1.04.3.g5b56eb5
pkgrel=1
pkgdesc='DXTn texture compression tool. Modified version from Unvanquished Development.'
arch=('x86_64' 'i686')
url='https://code.google.com/p/crunch/'
license=('ZLIB')
makedepends=('git')
depends=('glibc')
source=("crunch::git+https://github.com/Unvanquished/crunch.git")

pkgver() {
	cd "${srcdir}/crunch/"
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${srcdir}/crunch/crnlib"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/crunch"

	install -m755 "${srcdir}/crunch/crnlib/crunch" "${pkgdir}/usr/bin/crunch"
	install -m644 "${srcdir}/crunch/license.txt"   "${pkgdir}/usr/share/licenses/crunch/LICENSE"
}

md5sums=('SKIP')
