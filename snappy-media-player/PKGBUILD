# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=snappy-media-player
_pkgname=snappy
pkgver=1.0
pkgrel=1
pkgdesc="Media player with minimalistic interface."
arch=('x86_64')
url="http://projects.gnome.org/snappy/"
license=('GPL')
depends=(gstreamer clutter clutter-gst clutter-gtk gtk3 glib2 libxtst desktop-file-utils hicolor-icon-theme)
makedepends=(gnome-common)
conflicts=(snappy-player)
source=("https://git.gnome.org/browse/${_pkgname}/snapshot/${_pkgname}-${pkgver}.tar.gz")
install=$pkgname.install
sha512sums=('006720bebe98986c6c0920d9d779a2883e8f2c7eb2a1368671058e1aa3bb5b4f3d8fa22e4bb062e7c3237f8ac5b7b02390fcfa8ca9d58ee1cd5cbfc47e3b6299')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" configure.ac
  sed -i "s/Name=Movie Player/Name=Snappy Media Player/" data/snappy.desktop
  sed -i "s/Exec=snappy/Exec=$pkgname/" data/snappy.desktop
  sed -i "s/NoDisplay=true/NoDisplay=false/" data/snappy.desktop
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./autogen.sh --enable-udev --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/snappy $pkgdir/usr/bin/$pkgname
  mv $pkgdir/usr/share/applications/snappy.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
