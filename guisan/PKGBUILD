# Maintainer: kallisti5 unixzen.com
pkgbase=guisan
pkgname=guisan
pkgver=0.9.0
pkgrel=2
pkgdesc="An SDL2 compatible interface and windowing library"
depends=('sdl2' 'sdl2_image')
makedepends=('scons')
provides=('libguisan.a')
url="https://github.com/kallisti5/guisan"
license=('GPLv2')
arch=('i686' 'x86_64')

options=('staticlibs')

source=("https://github.com/kallisti5/guisan/archive/v${pkgver}.tar.gz")
sha256sums=('d4aec9ea6bf4150af457c560d66b55557d68d1e08d96d04a6ef903aac113ea2b')

build()
{
	cd guisan-${pkgver}
	scons prefix=/usr
}

package()
{
	# install library
	mkdir -p "${pkgdir}/usr/lib"
	cp "${pkgname}-${pkgver}/src/libguisan.a" "${pkgdir}/usr/lib/"

	# install pkg-config
	mkdir -p "${pkgdir}/usr/lib/pkgconfig"
	cp "${pkgname}-${pkgver}/src/guisan.pc" "${pkgdir}/usr/lib/pkgconfig/"

	# install includes
	mkdir -p "${pkgdir}/usr/include"
	cp "${pkgname}-${pkgver}/include/guisan.hpp" "${pkgdir}/usr/include/"
	cp -R "${pkgname}-${pkgver}/include/guisan" "${pkgdir}/usr/include/"
}
