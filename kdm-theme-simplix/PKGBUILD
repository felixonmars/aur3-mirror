# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=simpliX
pkgname=kdm-theme-simplix
pkgver=r3.888f015
pkgrel=1
pkgdesc="simpliX theme for KDM."
arch=(
	"any"
)
url="http://sixsixfive.deviantart.com/art/simpliX-346404452"
license=(
	"CCPL:cc-by-4.0"
)

depends=(
	"kdebase-workspace>=4.3"
	"ttf-dejavu"
)
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
	"git+https://github.com/sixsixfive/${_themename}.git"
)
md5sums=(
	"SKIP"
)
sha512sums=(
	"SKIP"
)

_themename=simpliX

pkgver() {
	cd ${srcdir}/${_themename}
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {	
	# Installing KDM theme
	mkdir -p ${pkgdir}/usr/share/apps/kdm/themes
	cp -R ${srcdir}/${_themename}/extras/KDM-4.3/${_themename} ${pkgdir}/usr/share/apps/kdm/themes
}