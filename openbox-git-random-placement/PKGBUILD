# Maintainer: David couzelis <drcouzelis@gmail.com>

pkgname=openbox-git-random-placement
_pkgname=openbox-git
pkgver=3.5.2.12.geffa866
pkgrel=1
pkgdesc="A window manager for the X11 windowing system with the random window placement patch applied"
arch=(i686 x86_64)
url=http://openbox.org/
license=(GPL2)
depends=(libsm libxcursor libxinerama libxml2 libxrandr pango startup-notification)
makedepends=(docbook-to-man git)
optdepends=('pyxdg: for the xdg-autostart script')
provides=(${_pkgname%-*}=$pkgver)
conflicts=(${_pkgname%-*})
backup=(etc/xdg/openbox/menu.xml
    etc/xdg/openbox/rc.xml)
options=(!libtool)
install=$pkgname.install
source=($_pkgname::git://git.openbox.org/dana/${_pkgname%-*}.git
        openbox-random-placement.patch)
sha256sums=('SKIP'
            'ce8e3aafa2daac2c840e2dfefb77d82d358468daf2efac404912709800a8d654')
sha512sums=('SKIP'
            'b471ae0cf13054656594caecb11184137add3e4fb5819033560798e7c985d52f00393d6998e035662f5e68351cf9ccdb024e3eb460923e600d44096d0bafb3b2')

pkgver() {
    cd $_pkgname/
    git describe | sed 's/^release-//;s/-/./g'
}

prepare() {
    cd $_pkgname/

    # Apply the patch that performs random window placement
    patch -p1 -i "$srcdir/openbox-random-placement.patch"
}

build() {
    cd $_pkgname/
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --with-x \
        --enable-startup-notification \
        --sysconfdir=/etc
    make
}

package() {
    make -C $_pkgname DESTDIR="$pkgdir" install
}
