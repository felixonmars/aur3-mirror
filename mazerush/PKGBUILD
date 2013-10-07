# Contributor: Erico Nunes <nunes.ericoATgmail>
# Maintainer: Erico Nunes <nunes.ericoATgmail>

pkgname=mazerush
pkgver=v0.8.2
pkgrel=1
pkgdesc="3D maze racing game"
arch=("i686")
url="https://bitbucket.org/enunes/mazerush"
license=(unknown)
depends=('mesa' 'glm' 'ftgl' 'glfw2' 'openal' 'freealut')
makedepends=('git')
source=("$pkgname"::'git+https://bitbucket.org/enunes/mazerush.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --tags)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "$pkgname"
	make BASE_PATH=${pkgdir}/usr RELEASE=1
}

package() {
	cd "$pkgname"
	make install
}
