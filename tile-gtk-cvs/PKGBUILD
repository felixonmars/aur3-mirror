# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=tile-gtk-cvs
pkgver=20120824
pkgrel=1
pkgdesc="A theme for the tile toolkit, which uses the GTK+/GNOME style engine to draw widgets"
arch=('i686' 'x86_64')
url='http://www.ellogon.org/petasis/tcltk-projects/tilegtk'
license=('GPL')
depends=('tk' 'gtk2')
makedepends=('cvs' 'cmake')
provides=('tile-gtk')
conflicts=('tile-gtk')

_cvsroot=":pserver:anonymous@tktable.cvs.sourceforge.net:/cvsroot/tktable"
_cvsmod="tile-themes/tile-gtk"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/build"

  #
  # BUILD HERE
  #
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake ../$_cvsmod \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
