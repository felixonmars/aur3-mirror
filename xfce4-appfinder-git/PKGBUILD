# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from xfce4-appfinder package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>

_pkgname=xfce4-appfinder
pkgname=$_pkgname-git
pkgver=4.10.0.44.g7f96fc1
pkgrel=1
pkgdesc="Xfce application finder"
arch=(i686 x86_64)
url=http://www.xfce.org/projects/$_pkgname
license=(GPL2)
groups=(xfce4-git)
depends=(garcon-git libxfce4ui-git)
makedepends=(git)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!libtool)
install=$_pkgname.install
source=($pkgname::git://git.xfce.org/xfce/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfce4-appfinder-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
    --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
