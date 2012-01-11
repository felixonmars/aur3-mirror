# Maintainer: oke3 < Sekereg [at] gmx [dot] com >

pkgname=taglib-sharp-git
pkgver=20120111
pkgrel=1
pkgdesc="Free and Open Source library for the .NET 2.0 and Mono frameworks which will let you tag your software with as much or as little detail as you like without slowing you down."
url="http://github.com/mono/taglib-sharp"
arch=('any')
license=('LGPL2')
depends=('mono')
makedepends=('git')
conflicts=('taglib-sharp')
provides=('taglib-sharp')

_gitroot="git://github.com/mono/taglib-sharp.git"
_gitname="taglib-sharp"

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin && cd "$srcdir"
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$_gitname-build"
    git clone "$_gitname" "$_gitname-build"
    cd "$_gitname-build"

    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-docs

    make
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install
}
