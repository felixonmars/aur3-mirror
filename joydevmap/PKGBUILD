# Maintainer: Kozec <kozec at kozec dot com>

pkgname='joydevmap'
pkgver=1.0
pkgrel=1
_tag=c07e6be
pkgdesc='Userspace tool to change the axis and button mappings of joysticks and gamepads in Linux'
arch=('i686' 'x86_64')
license=("GPL3")
depends=('')	# Probably nothing
makedepends=('cmake')
url="http://www.sthu.org/code/joydevmap.html"
source=("joydevmap-${pkgver}.tar.gz::http://git.sthu.org/?p=joydevmap.git;a=snapshot;h=c07e6be43a29393938397b3e901b2f131f3d362a;sf=tgz")

build() {
	cd ${srcdir}/${pkgname}-${_tag}
	cmake -D CMAKE_BUILD_TYPE="Release" .
	make
}

package() {
	cd ${pkgdir}
	mkdir -p usr/bin
	install -m 755 ${srcdir}/${pkgname}-${_tag}/src/joydevmap usr/bin/joydevmap
}

md5sums=('d5364ae1cb30d614389a0258c4bbf402')
