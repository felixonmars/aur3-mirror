# Maintainer: kallisti5 unixzen.com
pkgbase=huexpress
pkgname=huexpress
pkgver=3.0.1
pkgrel=1
pkgdesc="A full featured PC Engine / TurboGrafx-16 emulator"
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'libzip')
makedepends=('scons')
provides=('huexpress')
url="https://github.com/kallisti5/huexpress"
license=('GPLv2')
arch=('i686' 'x86_64')

source=("https://github.com/kallisti5/huexpress/archive/${pkgver}.tar.gz")
sha256sums=('6cafa2a1eda62dcf9251083c45bc248f48e49b6b30b610648300a4b7aab074cf')

build()
{
	cd huexpress-${pkgver}
	scons
}

package()
{
	mkdir -p "${pkgdir}/usr/bin/"
	# install binary
	cp "huexpress-${pkgver}/src/huexpress" "${pkgdir}/usr/bin/huexpress"
}
