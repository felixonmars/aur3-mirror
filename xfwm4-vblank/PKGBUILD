# Maintainer:  Nikita <i.nnikishi@gmail.com>

# Original PKGBUILD (xfwm4-devel):
# Maintainer:  Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfwm4-vblank
_pkgname=xfwm4
pkgver=4.10.0
pkgrel=1
pkgdesc="Xfce window manager (with sync to VBlank patche)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4ui>=4.9.0' 'xfconf>=4.8.0' 'libwnck' 'hicolor-icon-theme' 'xf86driproto')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
install=$_pkgname.install
source=(
    "http://archive.xfce.org/src/xfce/$_pkgname/4.10/$_pkgname-$pkgver.tar.bz2"
    "https://bugzilla.xfce.org/attachment.cgi?id=4465"
)
sha1sums=(
    '1549954949b5e1f38a2279a39a477b52bb5339f2'
    '40ceb1e8d2705025264fa60a687d812ee6884fb7'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")

build() {
  patch -p1 -f -i attachment*
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's,drm/drm.h,libdrm/drm.h,' src/compositor.c

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
