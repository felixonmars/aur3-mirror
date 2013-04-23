# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=gmpc-albumview
pkgname=$_pkgname-git
pkgver=11.8.16.8.g848763d
pkgrel=1
pkgdesc="Browse your GMPC library by album covers"
arch=(i686 x86_64)
url=http://gmpc.wikia.com/wiki/GMPC_PLUGIN_ALBUMVIEW
license=(GPL)
depends=(gmpc-git)
makedepends=(git intltool)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!libtool)
source=($pkgname::git://repo.or.cz/$_pkgname.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^release-//;s/-/./g'
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
