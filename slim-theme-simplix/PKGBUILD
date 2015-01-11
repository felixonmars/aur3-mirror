# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=simpliX
pkgname=slim-theme-simplix
pkgver=r3.888f015
pkgrel=2
pkgdesc="simpliX theme for SLiM."
arch=(
	"any"
)
url="http://sixsixfive.deviantart.com/art/simpliX-346404452"
license=(
	"CCPL:cc-by-4.0"
)

depends=(
	"slim>=1.3.6"
	"ttf-anonymous-pro"
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
	"slim.theme.patch"
)
sha384sums=(
	"SKIP"
	"6bd30dee626c02fb735fb29cdb8b6ee901a37e4f9fd922ba6c2845c9033396630a77a817a4f88aa336b76de51efecbf7"
)
sha512sums=(
	"SKIP"
	"12139a3068d4370b2d405212a14c5db0b19f03b200682c00b790643dabcfd756b569618e3f662d85ed5575644d1f1336662d7ea1c404bf502813ea6abbe5e77f"
)

pkgver() {
	cd ${srcdir}/${_themename}
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	# Patching slim.theme file
	patch ${srcdir}/${_themename}/extras/SLiM-1.3.6/${_themename}/slim.theme < ${srcdir}/slim.theme.patch
}

package() {
	# Installing SLiM theme
	mkdir -p ${pkgdir}/usr/share/slim/themes
	cp -R ${srcdir}/${_themename}/extras/SLiM-1.3.6/${_themename} ${pkgdir}/usr/share/slim/themes
}