# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=gxine
pkgver=0.5.907
pkgrel=2
pkgdesc="GTK+ frontend for xine"
arch=('i686' 'x86_64')
url="http://www.xine-project.org/"
license=('GPL')
depends=('xine-lib' 'gtk2' 'js' 'lirc-utils'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('libxaw')
optdepends=('libxaw: Mozilla browser plugin')
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/xine/gxine-$pkgver.tar.xz")
md5sums=('da83ba0e0e8794465b60419009029d2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # glib2 fix
  sed -i "/<glib\//d" src/*

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-integration-wizard \
              --with-browser-plugin \
              --with-logo-format=image \
              --with-dbus \
              --with-gudev \
              --enable-watchdog \
              --disable-deprecated \
              --disable-own-playlist-parsers \
              --enable-mozjs \
              VENDOR_PKG_VERSION="$pkgver-$pkgrel; Arch Linux"

  make LDFLAGS="$LDFLAGS -lm"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # mozilla plugin
  install -d "$pkgdir/usr/lib/mozilla/plugins"
  ln -s /usr/lib/gxine/gxineplugin.so \
    "$pkgdir/usr/lib/mozilla/plugins"
}
