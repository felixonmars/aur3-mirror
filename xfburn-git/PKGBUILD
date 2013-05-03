# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from xfburn package)
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

_pkgname=xfburn
pkgname=$_pkgname-git
pkgver=0.4.3.279.g79332f2
pkgrel=1
pkgdesc="A simple CD/DVD burning tool based on libburnia libraries"
arch=(i686 x86_64)
url=http://www.xfce.org/projects/$_pkgname
license=(GPL2)
groups=(xfce4-goodies)
depends=(desktop-file-utils exo-git gstreamer0.10-base hicolor-icon-theme libburn libisofs libxfce4util-git)
makedepends=(git xfce4-dev-tools)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
install=$_pkgname.install
source=($pkgname::git://git.xfce.org/apps/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfburn-//;s/-/./g'
}

prepare() {
    sed -i 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' $pkgname/configure.in.in
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --enable-gstreamer \
        --enable-dbus \
        --disable-hal
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
