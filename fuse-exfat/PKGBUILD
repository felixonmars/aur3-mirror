pkgname=fuse-exfat
pkgver=0.9.6
pkgrel=1
pkgdesc="Free exFAT file system implementation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/exfat/"
license=('GPL3')
depends=('fuse')
makedepends=('scons')
optdepends=('exfat-utils: utilities for exFAT file system')
source=(http://exfat.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('809be0bc49c3b2be3f2d0fd115d36709')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	scons || return 1
	mkdir -p ${pkgdir}/sbin/
	scons install DESTDIR=${pkgdir}/sbin || return 1
	mkdir -p ${pkgdir}/usr/share/man/man8/
	gzip -9 -c fuse/mount.exfat-fuse.8 > ${pkgdir}/usr/share/man/man8/mount.exfat-fuse.8.gz
}