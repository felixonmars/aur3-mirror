# $Id$
# Maintainer: Davide Depau

pkgname=xfwm4-wbr
pkgver=4.10.1
pkgrel=1
pkgdesc="Xfce window manager with patch to make it work on some touchscreens. Same version as main repository (as far as I can)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4ui' 'libwnck' 'hicolor-icon-theme')
makedepends=('intltool')
provides=(xfwm4)
conflicts=(xfwm4)
install=$pkgname.install
source=(http://archive.xfce.org/src/xfce/xfwm4/4.10/xfwm4-$pkgver.tar.bz2
       'touch_events_on_window_frame.patch')
sha256sums=('380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740'
            'SKIP')
md5sums=(
    'SKIP'
    '440b187de154c539f2e64354d11fade4'
)

build() {
  cd "$srcdir/xfwm4-$pkgver"

	patch -Np1 -i ../../touch_events_on_window_frame.patch

  ./configure \
    --prefix=/usr \
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
  cd "$srcdir/xfwm4-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
