# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='libra-git'
pkgver=0.0.0
pkgrel=1
pkgdesc='An 8086 emulator with a focus on educational features.'
arch=('i686' 'x86_64')
url='https://github.com/rdnelson/Libra'
license=('GPL3')
depends=('qt4')
makedepends=('cmake' 'git' 'python-sphinx')
provides=('libra')
source=('git+https://github.com/kevincox/Libra.git#branch=cmakeqt4fix')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/Libra"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build()
{
	mkdir -p "$srcdir/Libra/build/"
	cd "$srcdir/Libra/build/"
	cmake "$srcdir/Libra"
	make
}

package()
{
	cd "$srcdir/Libra/build/"
	
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 bin/libra "$pkgdir/usr/bin/"
}

