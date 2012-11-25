# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=mali400
pkgver=2.1
pkgrel=1
pkgdesc="Mali implementation of OpenGL ES, OpenVG and EGL"
arch=('armv7h')
url="http://github.com/linux-sunxi/mali-libs"
license=('custom')
depends=('glibc' 'libdrm' 'gcc-libs' 'libx11' 'libxext' 'libxfixes')
depends=('git' 'make')

package() {
	cd $srcdir
	git clone $url --depth=1
	cd mali-libs/lib/r3p0/armhf/x11
	mkdir -p $pkgdir/usr/lib
	make prefix=$pkgdir/usr/
}
