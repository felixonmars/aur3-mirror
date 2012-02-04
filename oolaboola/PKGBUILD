# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=oolaboola
pkgver=0.3.1
pkgrel=1
pkgdesc="virtual turntable fun with Eric Tiedemann's 'open-source cyber-shamanic noise-maker'"
url="http://www.hyperreal.org/~est/oolaboola/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python' 'gtk2' 'pygtk' 'gcc')
source=("http://hyperreal.org/~est/oolaboola/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('61ecdb8354baa0e2c8dead46ed40f62a')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || return 1

	make ./configure || return 1
	make || return 1
	mkdir -p ${pkgdir}/usr/bin/

	chmod -R 755 ${pkgdir}/usr/bin
}
