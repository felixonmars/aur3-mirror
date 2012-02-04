# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=vstpack_64
pkgver=1
pkgrel=1
url=('http://destroyfx.smartelectronix.com/')
pkgdesc="Miscellaneous VST plug-ins, including DestroyFX, originally collected by Filipe Coelho."
arch=('x86_64')
depends=('libgl' 'gcc-libs' 'freetype2' 'libxext')
license=('GPL')
source=(http://dl.dropbox.com/u/5977716/vstpack_64.tar.gz)

md5sums=('3fffcb4b99ac2f0da5a04a65d3f151f9')

build() {
	mkdir -p $pkgdir/usr/lib/vst
	cp $srcdir/*.so $pkgdir/usr/lib/vst
}
