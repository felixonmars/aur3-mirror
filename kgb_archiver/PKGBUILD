# Contributor: Rudy Matela <rudy.matela@gmail.com>
# Maintainer: Rudy Matela <rudy.matela@gmail.com>
pkgname=kgb_archiver
pkgver="1.0b4"
pkgrel=2
pkgdesc="A compression tool with an unbelievably high compression rate and high hardware requirements"
arch=('i686')
url="http://kgbarchiver.net/"
license=('GPL')
depends=('gcc-libs')
makedepends=()
source=("http://downloads.sourceforge.net/kgbarchiver/kgb_arch_posix_by_slawek_v$pkgver.tar.bz2"
        'cstring_include.patch')
md5sums=('447d868e3e576e96a9806220dd494641' 'cecb21d325f1cbdda706b4aea5dc5e2a')

build() {
	cd $srcdir
	patch -p0 < $srcdir/cstring_include.patch || return 1
	make kgb_arch_posix_by_slawek || return 1
	return 0
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -s -m775 kgb_arch_posix_by_slawek $pkgdir/usr/bin/kgb_arch || return 1
	return 0
}
