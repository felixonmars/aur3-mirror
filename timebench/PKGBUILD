# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=timebench
pkgver=0.1
pkgrel=1
pkgdesc='Perl script to compare time and CPU consumption of given commands or alghoritms'
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=36368"
depends=('perl')
source=('timebench.pl')
md5sums=('bc640784daafa9a9436a439da2af7ad6')

build() {
	mkdir -p ${pkgdir}/usr/bin
	cp -f ${srcdir}/timebench.pl ${pkgdir}/usr/bin/timebench
	chmod -R 755 ${pkgdir}/
}
