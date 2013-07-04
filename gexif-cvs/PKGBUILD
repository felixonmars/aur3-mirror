# Contributor: Johan "Slikkie" van der Slikke <johan@slikkie.nl>
pkgname=gexif-cvs
pkgver=20130705
pkgrel=1
pkgdesc="A GTK+ based GUI interface to libexif-gtk"
url="http://libexif.sourceforge.net/"
license="GPL"
depends=('libexif-gtk')
makedepends=('cvs' 'libtool' 'pkgconfig' 'libexif-gtk')
conflicts=(gexif)
source=("gexif.desktop")
md5sums=("6ce94402bf1799d3982fb879ae6bd3a9")
arch=('i686' 'x86_64')

_cvsroot=":pserver:anonymous@libexif.cvs.sourceforge.net:/cvsroot/libexif"
_cvsmod=gexif

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

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  autoreconf -if
  ./configure --prefix=/usr --disable-nls
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$startdir/gexif.desktop" "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et: