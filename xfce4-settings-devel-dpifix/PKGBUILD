# Maintainer: glaville <laville dot guillaume at gmail dot com>
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel-dpifix
pkgver=4.11.3
pkgrel=1
pkgdesc="Settings manager for xfce (with DPI fix by brebs)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui>=4.11.0' 'libnotify' 'libxklavier'
         'gnome-icon-theme' 'gtk-engines')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        dpi-unchanged.patch)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  # Do not always override screen DPI to 96.
  # See https://bbs.archlinux.org/viewtopic.php?pid=1447838#p1447838
  # and https://bugzilla.xfce.org/show_bug.cgi?id=10633
  patch -Np1 -i "$srcdir/dpi-unchanged.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha256sums=('f9e40c039f3a06111b5b596abfe462ee067d98e46c6640bf33d3b6e76bc6cd34'
            'd97950128285f8ad52fec83232cb21f0045dc2b49e95dd55ece7153ea8f8f752')
