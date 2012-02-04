# Contributor: Pizon <pizon@pizon.org> 

pkgname=meanwhile-cvs
pkgver=20101004
pkgrel=2
pkgdesc="Meanwhile libraries.  Built from version 1.1.0 CVS snapshot"
arch=('i686' 'x86_64')
url="http://meanwhile.sourceforge.net/"
license=('GPL')
makedepends=('cvs' 'pkgconfig' 'gtk-doc')
options=('!makeflags')
provides=('meanwhile')

_cvsroot=":pserver:anonymous@meanwhile.cvs.sourceforge.net:/cvsroot/meanwhile"
_cvsmod="meanwhile"
_cvstag="meanwhile_v1_1_0"

build() {
  cd "$srcdir"

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -r $_cvstag -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

 ./autogen.sh
 ./autogen.sh
 ./configure --prefix=/usr --disable-doxygen --disable-mailme

  make || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install || return 1
}
