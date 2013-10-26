# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=9vx-hg
pkgver=335.780c7b9a5851
pkgrel=3
pkgdesc="An x86 virtual machine for running Plan9"
arch=('i686' 'x86_64')
license=('LGPLv2.1' 'BSD' 'LPL')
url="https://bitbucket.org/rminnich/vx32"
makedepends=('mercurial')
install="${pkgname}.install"
source=('hg+https://bitbucket.org/yiyus/vx32')
md5sums=('SKIP')

pkgver() {
	cd vx32
	echo $(hg identify -n).$(hg identify -i)
}

build() {
	cd $srcdir
	rm -rf $srcdir/build # start fresh
	cp -ar $srcdir/vx32 $srcdir/build
	cd $srcdir/build/src
	make
}

package() {
	cd $srcdir/build/src
	mkdir -p $pkgdir/opt/vx32/bin
	mkdir -p $pkgdir/opt/vx32/lib
	make prefix="$pkgdir/opt/vx32" install 
	install -Dm644 $srcdir/vx32/src/libvx32/LICENSE $pkgdir/usr/share/licenses/$pkgname/libvx32.LICENSE
	install -Dm644 $srcdir/vx32/src/vxrun/LICENSE $pkgdir/usr/share/licenses/$pkgname/vxrun.LICENSE
	install -Dm644 $srcdir/vx32/src/9vx/LICENSE $pkgdir/usr/share/licenses/$pkgname/9vx.LICENSE
}


