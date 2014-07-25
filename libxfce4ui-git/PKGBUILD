# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from libxfce4ui package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=libxfce4ui-git
pkgver=4.11.1.r14.g9e5e539
pkgrel=1
pkgdesc="A freedesktop.org compliant UI implementation for Xfce"
arch=(i686 x86_64)
url=http://git.xfce.org/xfce/${pkgname%-*}/tree/README
license=(GPL2)
groups=(xfce4-git)
depends=(gtk2 gtk3 hicolor-icon-theme libxfce4util-git startup-notification xfconf)
makedepends=(git xfce4-dev-tools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
install=$pkgname.install
source=($pkgname::git://git.xfce.org/xfce/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^libxfce4ui-//;s/-/.r/;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gtk-doc \
        --disable-debug \
        --with-vendor-info="Arch-Linux"
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
