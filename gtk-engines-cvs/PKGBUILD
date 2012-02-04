pkgname=gtk-engines-cvs
pkgver=20060203
pkgrel=4
pkgdesc="CVS version of Themes for GTK+ 2 with animated Clearlooks patches"
url="http://www.gnome.org"
depends=('x-server' 'gtk2' 'cvs')
provides=('gtk-engines')
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2' 'gtk-engines')
replaces=('gtk-engines')
source=()
md5sums=()
_cvsmod="gtk-engines"
_cvsroot=":pserver:anonymous@anoncvs.gnome.org:/cvs/gnome"
build() {
  cd $startdir/src
  touch ~/.cvspass
  msg "Connecting to gnome gtk-engines CVS server..."
  cvs -z3 -d $_cvsroot co $_cvsmod
  msg "CVS Checkout done or server timeout"
  cd $_cvsmod  
  sed -i -e 's|gtk gtk-2.0|gtk-2.0|g' themes/Redmond/Makefile.in
  msg "Starting make..."
  CFLAGS="${CFLAGS} -DHAVE_ANIMATION=1" ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --enable-animation
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
