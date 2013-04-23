# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Carbon <carbonjiao@gmail.com>
#
# (Added from gnome-doc-utils package)
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-doc-utils
pkgname=$_pkgname-git
pkgver=0.20.10.9.g88d8539
pkgrel=1
pkgdesc="Documentation utilities for Gnome"
arch=(any)
url=http://www.gnome.org
license=(GPL2 LGPL2.1)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=(docbook-xml docbook-xsl libxslt python2 rarian)
makedepends=(gnome-common intltool)
source=($pkgname::git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --localstatedir=/var \
        --disable-scrollkeeper \
        PYTHON=/usr/bin/python2
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
