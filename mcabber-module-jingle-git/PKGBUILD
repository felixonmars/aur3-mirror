# Maintainer: tuftedocelot@fastmail.fm
# Contributor: Shu <shu@shuu.ru>

_pkgname="mcabber-jingle"
pkgname=mcabber-module-jingle-git
pkgver=173
pkgrel=1
pkgdesc="This project aims to implement jingle for mcabber as a set of modules."
arch=('i686' 'x86_64')
url="https://github.com/alkino/mcabber-jingle/"
license=('GPL')
depends=('mcabber')
makedepends=('git' 'cmake' 'mcabber')
source=("git+https://github.com/alkino/mcabber-jingle.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"

	cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
	make DESTDIR=$pkgdir install
}
