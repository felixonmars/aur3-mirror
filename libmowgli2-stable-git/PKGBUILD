# Maintainer: Alex M <alex+aur@migame.org>

pkgname=libmowgli2-stable-git
pkgver=20120712
pkgrel=1
pkgdesc='A useful collection of routines for programming. Performance and usability-oriented extensions to C.'
url='http://www.atheme.org/project/mowgli'
license=('custom:Atheme')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
optdepends=('openssl: SSL support')
provides=('libmowgli2=2.0.0')

_xpkgver='2.0.0'
_gitroot='git://github.com/atheme/libmowgli-2.git'
_gitname="libmowgli-${_xpkgver}"

build() {
    cd "$srcdir"

    if [[ ! -d "$_gitname" ]]; then
        git clone "$_gitroot" -b "$_gitname" --single-branch "$_gitname"
    fi

    rm -rf "$srcdir/$_gitname-build"
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"

    cd "$srcdir/$_gitname-build"

    ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
    cd "$srcdir/$_gitname-build"

	make DESTDIR="$pkgdir" install

	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    rm -rf $(find "$pkgdir" -type d -name '.git')
}

