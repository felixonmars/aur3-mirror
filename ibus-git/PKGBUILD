# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jekyll Wu <adaptee@gmail.com>
# Contributor: riverscn <riverscn@gmail.com>
# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=ibus-git
pkgver=1.5.4.14.g8ce7ac6.12
pkgrel=1
pkgdesc="Next Generation Input Bus for Linux"
arch=(i686 x86_64)
license=(LGPL2.1)
url=http://ibus.googlecode.com
depends=(gtk2 gtk3 libnotify)
optdepends=(notification-daemon)
makedepends=(dconf gconf gnome-common gobject-introspection gtk-doc intltool iso-codes vala)
provides=(${pkgname%-*}=$pkgver)
options=(!emptydirs !libtool)
conflicts=(${pkgname%-*})
install=${pkgname%-*}.install
source=($pkgname::git://github.com/${pkgname%-*}/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(git describe --tags | sed 's/-/./g').$(git shortlog | grep -c '\s\+')
}

build() {
    cd $pkgname/
    export PYTHON=python2
    ./autogen.sh \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname%-*} \
        --sysconfdir=/etc \
        --enable-dconf \
        --disable-gconf \
        --disable-memconf
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
