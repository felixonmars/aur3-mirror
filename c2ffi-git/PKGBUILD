# Maintainer: Akshay Srinivasan <akshaysrinivasan@gmail.com>
# Modified from julia-git

_pkgname=c2ffi
pkgname=c2ffi-git
pkgver=r113.ef729d0
pkgrel=1
pkgdesc="This is a tool for extracting definitions from C, C++, and Objective C headers for use with foreign function call interfaces."
arch=('i686' 'x86_64')
url="https://github.com/rpav/c2ffi"
license=('GPL2')
depends=('clang')
provides=('c2ffi')
conflicts=('c2ffi')
source=('git://github.com/rpav/c2ffi.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    ( set -o pipefail
      git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
