# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=multimon
pkgver=20120306
pkgrel=1
pkgdesc="Linux Radio Transmission Decoder"
arch=('x86_64' 'i686')
url="http://www.baycom.org/~tom/ham/linux/multimon.html"
license=('GPL')
groups=()
depends=('sox')
makedepends=('patch' 'gcc')
source=($pkgname-src.tar.xz
	'multimon.diff'
	'multimon-missing-include.diff'
	'multimon-sox.diff')
md5sums=('9305be7560857fa1c89d0529031e3ceb'
	'32e2fbd82b1414bbce784deb59e571c2'
	'b6ca7b1891637df5263457533cc43afe'
	'fc67d09f91275b6909aca15e8fe017e3')


build() {
	cd "$srcdir/$pkgname-src"
	# patch
	patch -p0 < ../multimon.diff
	patch -p1 < ../multimon-missing-include.diff
	patch -p1 < ../multimon-sox.diff
	# compile
	make CFLAGS="-finline-functions -finline-small-functions -falign-loops=2 -falign-jumps=2 -falign-functions=2 -DARCH_I386 -O3"
}

package() {
	cd "$srcdir/$pkgname-src"
	install -d "$pkgdir/usr/bin/"
	install -m 755 bin-*/{gen,multimon} $pkgdir/usr/bin/
	install -d "$pkgdir/usr/share/doc/"
	install -m 644 multimon.html $pkgdir/usr/share/doc/
}
