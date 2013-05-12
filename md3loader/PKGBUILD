##
# Contributor: Todd Harbour <aur@quadronyx.org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=md3loader
pkgver=20110402
pkgrel=1
pkgdesc="An OpenGL viewer for Quake 3 MD3 models with support for lighting, texture mapping and animation."
arch=('i686')
license=('MIT')
url='http://tfc.duke.free.fr'
depends=(
	'glew'           \
	'freeglut'       \
	'libjpeg>=8.0.2' \
	)
source=( \
	"${url}/coding/src/${pkgname}.zip" \
)
md5sums=( \
	'3522e8a6cc918c2ae455be3bb8979435' \
)
sha1sums=( \
	'07f03ef11fa705d5ceebfbc33229dd5bef9d5396' \
)

build() {
	cd "${srcdir}/${pkgname}"

	make clean
	rm OpenGLMD3Loader*

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 -o root -g root "OpenGLMD3Loader" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -o root -g root "LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
