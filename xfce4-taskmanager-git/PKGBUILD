# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=xfce4-taskmanager
pkgname=$_pkgname-git
pkgver=1.0.1.19.gf0e4f3e
pkgrel=1
pkgdesc="Small taskmanager for the Xfce desktop"
arch=(i686 x86_64)
url=http://goodies.xfce.org/projects/applications/$pkgname
license=(GPL2)
groups=(xfce4-git)
depends=(libwnck)
makedepends=(git xfce4-dev-tools)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname{,-svn})
source=($pkgname::git://git.xfce.org/apps/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed "s/${_pkgname}-//;s/-/./g"
}

build() {
    cd $pkgname/
    ./autogen.sh  \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static
    make
}

package() {
    cd $pkgname/
    make DESTDIR="$pkgdir" install
}
