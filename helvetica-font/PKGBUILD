# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=helvetica-font
pkgver=r3.888f015
pkgrel=1
pkgdesc="Helvetica bitmap free font."
arch=(
	"any"
)
url="http://sixsixfive.deviantart.com/art/simpliX-346404452"
license=(
	"custom"
)

depends=()
optdepends=()
makedepends=(
	"git"
)
provides=(
	"${pkgname}=${pkgver}"
)
conflicts=(
	"${pkgname}"
)
replaces=(
	"${pkgname}"
)

source=(
	"git+https://github.com/sixsixfive/simpliX.git"
)
md5sums=(
	"SKIP"
)
sha512sums=(
	"SKIP"
)

pkgver() {
	cd ${srcdir}/simpliX
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	# Change the current working directory
	cd ${srcdir}/simpliX
	
	# Helvetica bitmap font
	mkdir -p ${pkgdir}/usr/share/fonts
	cp -R ./extras/Helvetica-Bitmap/{100dpi,75dpi} ${pkgdir}/usr/share/fonts
	
	# License
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	mv ${pkgdir}/usr/share/fonts/100dpi/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}