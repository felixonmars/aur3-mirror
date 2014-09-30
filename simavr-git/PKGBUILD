# Maintainer: Nidhogg
pkgname=simavr-git
_gitname=simavr
pkgver=20140923
pkgrel=1
pkgdesc="A new AVR simulator for linux, or any platform that uses avr-gcc"
arch=('i686' 'x86_64')
url="http://gitorious.org/simavr"
license=('GPL3')
depends=('avr-binutils' 'elfutils')
makedepends=('git' 'avr-libc')
source=("git+https://github.com/buserror/${_gitname}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git log -1 --format=%cd --date=short | sed 's/-//g'
}

build() {
	cd "$srcdir/$_gitname"
  make AVR_ROOT=/usr/avr CFLAGS="-O0 -Wall -Wextra -g -fPIC -std=gnu99 -Wno-sign-compare -Wno-unused-parameter" build-simavr
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr" DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
