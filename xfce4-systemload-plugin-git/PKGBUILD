# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from xfce4-systemload-plugin package)
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

_pkgname=xfce4-systemload-plugin
pkgname=$_pkgname-git
pkgver=1.1.1.14.g7470dfc
pkgrel=1
pkgdesc="A system load plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=(BSD)
url=http://git.xfce.org/panel-plugins/$_pkgname/tree/README
groups=(xfce4-git)
depends=(freetype2-infinality upower xfce4-panel)
makedepends=(git xfce4-dev-tools)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!libtool)
source=($pkgname::git://git.xfce.org/panel-plugins/$_pkgname)
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
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static
    make
}

package() {
    cd $pkgname/
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
