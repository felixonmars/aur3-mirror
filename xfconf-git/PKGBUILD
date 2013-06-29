# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from xfconf package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias@archlinux.org>

pkgname=xfconf-git
pkgver=4.10.0.15.gad34d1c
pkgrel=1
pkgdesc="A New Configuration Storage System for Xfce"
arch=(i686 x86_64)
url=http://git.xfce.org/xfce/${pkgname%-*}/tree/README
license=(GPL2)
groups=(xfce4-git)
depends=(libxfce4util-git)
makedepends=(git xfce4-dev-tools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git://git.xfce.org/xfce/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfconf-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static \
        --enable-gtk-doc \
        --with-perl-options=INSTALLDIRS="vendor" \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
