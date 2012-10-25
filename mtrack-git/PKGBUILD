# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>

pkgname=mtrack-git
pkgver=20121018
pkgrel=1
pkgdesc="A minimalistic bugtracker"
arch=('i686' 'x86_64' 'arm')
backup=('etc/mtrack/mtrack.conf')
url="https://github.com/pweingardt/mtrack"
license=('GPL')
depends=('xmlrpc-c' 'mysql++' 'sqlite3' 'openssl')
makedepends=('cmake')
options=('!makeflags')
provides=('mtrack')
conflicts=('mtrack')

source=(mtrackd)
sha256sums=(d42f09fac4ea7b3ce67a37d59fc10f9fca4c1ce22a429a4e043cc26726ede7bf)

_gitroot=git://github.com/pweingardt/mtrack.git
_gitname=mtrack

build() {
    cd "$srcdir"

    if [[ -d $_gitname ]]; then
        cd $_gitname && git pull origin && cd ..
    else
        git clone $_gitroot
    fi

    rm -rf $_gitname-build
    git clone $_gitname $_gitname-build
    cd $_gitname-build
    git submodule init
    git submodule update

    cmake -DSUPPORT_MYSQL=1 -DSUPPORT_SQLITE=1 -DCMAKE_INSTALL_PREFIX=/usr . || return 1
    make || return 1
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install
    install -D -m755 "$srcdir/mtrackd" "$pkgdir/etc/rc.d/mtrackd"
}
