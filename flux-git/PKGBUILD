# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>
pkgname=flux-git
pkgver=20111207
pkgrel=1
pkgdesc="flux is an interface description language used by DirectFB"
arch=('i686' 'x86_64')
url='http://git.directfb.org/?p=core/flux.git;a=summary'
license=('MIT')
makedepends=('git' 'gcc' 'autoconf')
depends=()
provides=('flux=1.1.1')
conflicts=('flux')

_gitroot='git://git.directfb.org/git/directfb/core/flux.git'
_gitname='flux'

build() {
    msg "Connecting to git server..."
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
    fi
    msg "git checkout done or server timeout"

    rm -rf "$srcdir/$_gitname-build"
    mkdir "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    autoreconf -fi "../$_gitname"
    "../$_gitname/configure" --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
}



