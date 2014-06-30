## Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
## Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
## Contributor: Johannes Schriewer <jschriewer@arcor.de>
pkgname=zisofs-tools
pkgver=1.0.8
pkgrel=6
pkgdesc="Tools for creating transparently compressed ISO files"
url='https://www.kernel.org/pub/scm/fs/zisofs/zisofs-tools.git'
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
makedepends=('git')
source=('git+https://git.kernel.org/pub/scm/fs/zisofs/zisofs-tools.git#tag=zisofs-tools-1.0.8')
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make install prefix="${pkgdir}/usr/"
}