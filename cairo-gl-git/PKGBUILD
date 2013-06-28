# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Aljosha Papsch <papsch.al@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Disfido <disfido@gmail.com>

pkgname=cairo-gl-git
pkgver=1.12.14.78.g7b8fc77
pkgrel=1
pkgdesc="Cairo vector graphics library with GL and EGL enabled"
arch=(i686 x86_64)
url=http://cairographics.org/
license=(LGPL2.1 MPL)
depends=(fontconfig libegl libpng libxrender pixman)
makedepends=(gtk-doc git librsvg mesa poppler-glib)
provides=(cairo{,-xcb}=$pkgver)
conflicts=(cairo)
options=(!libtool)
source=($pkgname::git://anongit.freedesktop.org/git/cairo)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/-/./g'
}

build() {
    cd $pkgname/
    # glesv2 and gl cannot be enabled at the same time.
    # Please take a look at: http://lists.freedesktop.org/archives/cairo/2011-July/022138.html
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-gl \
        --enable-egl \
        --enable-xcb \
        --disable-static
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
