# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from xfdesktop package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfdesktop-git
pkgver=4.11.6.r38.g86e6380
pkgrel=1
pkgdesc="A desktop manager for Xfce"
arch=(i686 x86_64)
url=http://git.xfce.org/xfce/${pkgname%-*}/tree/README
license=(GPL2)
groups=(xfce4-git)
depends=(garcon libwnck libxfce4ui-git thunar)
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
    git describe | sed 's/^xfdesktop-//;s/-/.r/;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-thunarx \
        --enable-notifications \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
