# Contributer: N30N <archlinux@alunamation.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gimp-plugin-jp2
pkgver=0.1
pkgrel=3
pkgdesc="Adds JPEG 2000 support to GIMP"
arch=('i686' 'x86_64')
url='http://registry.gimp.org/node/9899'
license=('custom:MIT')
depends=('gimp' 'openjpeg')
makedepends=('autoconf' 'automake' 'glib2' 'intltool')
source=('http://registry.gimp.org/files/jp2.tar.gz')
md5sums=('dfe378981796eaeefde35874d175c9e0')

build() {
	cd ${srcdir}/jp2
	sed -i 's|2#!|#!|' autogen.sh
	sed -i 's|1.6|1.11|g' autogen.sh
	./autogen.sh
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd ${srcdir}/jp2
	make DESTDIR=${pkgdir} install
	install -Dm644 ${srcdir}/jp2/COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
