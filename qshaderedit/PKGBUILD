# Contributor: berkus
# Maintainer: Erico Nunes <nunes.erico at gmail>
pkgname=qshaderedit
pkgver=0.1.3
pkgrel=4
pkgdesc="Simple multiplatform shader editor inspired by Apple's OpenGL Shader Builder."
arch=(i686 x86_64)
url="http://code.google.com/p/qshaderedit/"
license=('GNU GPLv2')
makedepends=('cmake')
depends=('qt4' 'glew' 'nvidia-cg-toolkit')
source=("http://qshaderedit.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('b6595c3ebb8ba465cd2effd59b190255')

build() {
	cd "${srcdir}/${pkgname}"

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}

