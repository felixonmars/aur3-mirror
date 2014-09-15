# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: Xaseron <xaseron@googlemail.com>

pkgname="pamm"
pkgver=v4.0.2.r7.g35a19e7
pkgrel=1
pkgdesc="Mod manager for the game Planetary Annihilation"
url="https://github.com/DeathByDenim/pamm"
license=("GPL")
arch=("i686" "x86_64")
depends=("qt4" "libzip" "qjson")
makedepends=("git" "cmake")
optdepends=( \
	"planetary-annihilation: to play the game" \
	"planetary-annihilation-pte: to play the game" \
	"steam: install and play the game")
source=("git://github.com/DeathByDenim/pamm.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -E "s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
	cd "${pkgname}"
	cmake .
	make
}

package() {
	cd "${pkgname}"
	install -d "${pkgdir}/opt/pamm/img"
	install -m644 img/* "${pkgdir}/opt/pamm/img"
	install -m755 pamm "${pkgdir}/opt/pamm/"
}

# vim: set noet ff=unix:
