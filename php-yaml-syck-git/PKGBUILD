pkgname=php-yaml-syck-git
pkgver=20120606
pkgrel=2
pkgdesc="Syck PHP extension"
arch=('i686' 'x86_64' 'arm')
url="http://github.com/indeyets/syck"
license=('BSD')
depends=('syck-git' 'php')
makedepends=('git' 're2c')
conflicts=('php-yaml-syck')
provides=('php-yaml-syck')

_gitroot="git://github.com/indeyets/syck.git"
_gitname="syck"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # BUILDING MODULE
    cd ext/php/
    phpize
    ./configure --with-syck=/usr/lib/ --prefix=$pkgdir
    make
    install -m0755 -D modules/syck.so ${pkgdir}/usr/lib/php/modules/syck.so
}

# vim:set ts=2 sw=2 et:
