# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from terminal package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-terminal-git
pkgver=0.6.2.9.ge30d61d
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment"
arch=(i686 x86_64)
url=http://www.xfce.org/projects/${pkgname%-*}/
license=(GPL2)
groups=(xfce4-git)
depends=(libxfce4ui-git vte)
makedepends=(git xfce4-dev-tools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
install=$pkgname.install
source=($pkgname::git://git.xfce.org/apps/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfce4-terminal-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
