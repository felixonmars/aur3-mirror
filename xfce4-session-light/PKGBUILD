# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on xfce4-session from [extra]

pkgname=xfce4-session-light
_pkgname=xfce4-session
pkgver=4.10.1
pkgrel=2
pkgdesc="A session manager for Xfce (GNOME and *kit free!)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4ui' 'libwnck' 'libsm' 'xorg-iceauth' 'xorg-xinit' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
replaces=('xfce-utils')
conflicts=('xfce4-session' 'upower' 'polkit' 'consolekit')
provides=('xfce4-session')
options=('!libtool')
install=$pkgname.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/4.10/$_pkgname-$pkgver.tar.bz2)
sha256sums=('0154fabdc398798c3445374ccc52a2f5bcb2d867fc94bc54114395b24f9cfc83')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
