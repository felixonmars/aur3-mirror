# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from thunar-vfs package)
# Contributor: SpepS <dreamspepser@yahoo.it>

pkgname=thunar-vfs-git
pkgver=1.2.0.66.g87ecd88
pkgrel=1
pkgdesc="Virtual filesystem shipped with the thunar 1.0 and earlier releases (git version)"
url=http://git.xfce.org/archive/${pkgname%-*}/tree/README
arch=(i686 x86_64)
license=(GPL2)
groups=(xfce4-git)
depends=(exo-git hal gamin gconf libsm)
makedepends=(git xfce4-dev-tools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git://git.xfce.org/archive/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^thunar-vfs-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --enable-startup-notification \
        --enable-dbus \
        --with-volume-manager=hal \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
