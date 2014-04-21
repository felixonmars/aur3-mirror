# Maintainer: raininja <daniel.mclellan@gmail.com>

pkgname=quassel-irssi
pkgver=61.384a3d8
pkgrel=1
pkgdesc="An irssi plugin to connect to quassel core."
arch=('i686' 'x86_64')
url="https://github.com/phhusson/quassel-irssi"
license=('custom')
makedepends=('git' 'quassel' 'irssi')
source=('git+https://github.com/phhusson/quassel-irssi')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"

  echo $_ver$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$srcdir/$pkgname" 
	msg "submodule processing. . . "
	git submodule init
	git submodule update
}

build() {
  	cd "$srcdir/$pkgname/core"
	
	make 
}
package() {
        cd "$srcdir/$pkgname/core"
	install -Dm644  libquassel_core.so "$pkgdir/usr/lib/irssi/modules/libquassel_core.so"
}
