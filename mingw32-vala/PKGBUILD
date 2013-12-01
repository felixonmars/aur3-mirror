pkgname=mingw32-vala
pkgver=0.22.1
pkgrel=1
pkgdesc="Compiler for the GObject type system (mingw32)"
arch=('any')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('mingw32-glib2')
makedepends=('mingw32-libxslt' 'bison')
source=(http://ftp.gnome.org/pub/gnome/sources/vala/${pkgver%.*}/vala-$pkgver.tar.xz)
sha256sums=('92c61b94a427f281ba2537b69135a3be23248b153268057d7195003dd6aba28c')

build() {
    cd vala-$pkgver
    aclocal
    unset CFLAGS
    unset LDFLAGS
    export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig"
    ./configure \
    --disable-vapigen \
    --disable-maintainer-mode \
    --disable-dependency-tracking \
    --disable-libtool-lock \
    --disable-unversioned \
    --prefix="/usr/i486-mingw32" \
    --target="i486-mingw32" \
    --host="i486-mingw32" \
    --exec-prefix="/usr/i486-mingw32"
    make
}

package() {
    cd vala-$pkgver
    make DESTDIR="$pkgdir" install
}
