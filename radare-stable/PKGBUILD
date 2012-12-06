# Contributor: Patrick Hof <patrickhof@web.de>

pkgname=radare-stable
pkgver=1.5.2
pkgrel=1
pkgdesc="A collection of tools with the aim to create a complete, portable, multi-architecture, unix-like toolchain for reverse engineering."
arch=('i686' 'x86_64')
url="http://radare.nopcode.org"
license=('GPL2')
depends=('bash' 'perl' 'python2')
source=("http://radare.nopcode.org/get/radare-${pkgver}.tar.gz")
provides=('radare')
conflicts=('radare-hg' 'radare-git')
md5sums=('141cd4859463cd8152b2a61413865327')

build() {
	cd "${srcdir}/radare-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/radare-${pkgver}"
	make DESTDIR="${pkgdir}" install

	#install -d "${pkgdir}/usr/share/man/man1"
	#install -m644 man/* "${pkgdir}/usr/share/man/man1"
}
