# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=snappy-player
_pkgname=snappy
pkgver=0.3.7
pkgrel=2
pkgdesc="Media player with minimalistic interface"
arch=('x86_64')
url="http://projects.gnome.org/snappy/"
license=('GPL')
depends=(gstreamer clutter clutter-gst clutter-gtk gtk3 glib2 libxtst desktop-file-utils hicolor-icon-theme)
makedepends=(gnome-common)
source=("https://git.gnome.org/browse/${_pkgname}/snapshot/${_pkgname}-${pkgver}.tar.gz")
install=snappy-player.install
md5sums=('84a8902e07929015bbb129ed04af1ec9')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" configure.ac
  sed -i "s/Exec=snappy/Exec=snappy-player/" data/snappy.desktop
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
  mv $pkgdir/usr/bin/snappy $pkgdir/usr/bin/snappy-player
  mv $pkgdir/usr/share/applications/snappy.desktop $pkgdir/usr/share/applications/snappy-player.desktop
}

# vim:set ts=2 sw=2 et:
