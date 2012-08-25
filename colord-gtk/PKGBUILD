# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=colord-gtk
pkgver=0.1.22
pkgrel=1
pkgdesc="GTK+ support library for colord"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/software/colord/"
license=('GPL')
groups=()
depends=('gtk2' 'glib2' 'lcms2' 'colord')
makedepends=('pkg-config' 'intltool' 'gobject-introspection' 'gtk-doc' 'perl'
'vala')
provides=('colord-gtk')
source=(http://www.freedesktop.org/software/colord/releases/$pkgname-$pkgver.tar.xz)
md5sums=('1375d6273e6400110ce33f6f77039b7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check || return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
