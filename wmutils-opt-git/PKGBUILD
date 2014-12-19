# Maintainer: Camille <onodera@rizon>

pkgname=wmutils-opt-git
pkgver=v0.1.r3.ge4cf962
pkgrel=1
pkgdesc="Set of window manipulation tools. (opt)"
url="https://github.com/wmutils/opt"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libxcb')
source=("$pkgname::git+https://github.com/wmutils/opt.git")
sha1sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}

