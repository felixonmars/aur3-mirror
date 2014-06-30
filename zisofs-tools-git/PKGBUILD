## Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
## Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
## Contributor: Johannes Schriewer <jschriewer@arcor.de>
pkgname=zisofs-tools-git
pkgver=1.0.8.git20111104
pkgrel=1
pkgdesc="Tools for creating transparently compressed ISO files, git branch."
url='https://www.kernel.org/pub/scm/fs/zisofs/zisofs-tools.git'
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
makedepends=('git')
source=('git+https://git.kernel.org/pub/scm/fs/zisofs/zisofs-tools.git')
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	echo "1.0.8.git$(git log -1 --format="%cd" --date=short | sed 's|-||g')"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make install prefix="${pkgdir}/usr/"
}