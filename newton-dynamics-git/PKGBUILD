# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Josh Taylor (deficite) <joshtaylor.mail@gmail.com> 
# Contributor: Christophe Robin (bombstrike) <crobin@php.net> 
_pkgname=newton-dynamics
pkgname=newton-dynamics-git
pkgver=r2207.e5f3f20
pkgrel=1
pkgdesc="A simple physics API"
arch=('i686' 'x86_64')
url="http://www.newtondynamics.com"
license=('zlib')
depends=()
source=("git://github.com/MADEAPPS/newton-dynamics/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/$_pkgname"

	mkdir -p build && cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 "build/lib/libNewton.a" "$pkgdir/usr/lib/libNewton.a"
	install -D -m755 "build/lib/libNewton.so" "$pkgdir/usr/lib/libNewton.so"
	install -D -m644 "coreLibrary_300/source/newton/Newton.h" "$pkgdir/usr/include/Newton.h"
}
