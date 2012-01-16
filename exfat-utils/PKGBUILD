# Maintainer: ava1ar <mail.avatar@gmail.com>

pkgname=exfat-utils
pkgver=0.9.6
pkgrel=1
pkgdesc="Utilities for exFAT file system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/exfat/"
license=('GPL3')
depends=('glibc')
makedepends=('scons')
source=(http://exfat.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('6722b7a919b4924bc64f86bccfedb0a6')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	scons
	mkdir -p ${pkgdir}/sbin/
	scons install DESTDIR=${pkgdir}/sbin
	mkdir -p ${pkgdir}/usr/share/man/man8/
	gzip -9 -c dump/dumpexfat.8 > ${pkgdir}/usr/share/man/man8/dumpexfat.8.gz
	gzip -9 -c fsck/exfatfsck.8 > ${pkgdir}/usr/share/man/man8/exfatfsck.8.gz
	gzip -9 -c mkfs/mkexfatfs.8 > ${pkgdir}/usr/share/man/man8/mkexfatfs.8.gz
	gzip -9 -c label/exfatlabel.8 > ${pkgdir}/usr/share/man/man8/exfatlabel.8.gz
}
